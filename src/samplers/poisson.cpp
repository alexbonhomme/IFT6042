/*
    This file is part of Mitsuba, a physically based rendering system.

    Copyright (c) 2007-2012 by Wenzel Jakob and others.

    Mitsuba is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License Version 3
    as published by the Free Software Foundation.

    Mitsuba is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#include <mitsuba/render/sampler.h>

MTS_NAMESPACE_BEGIN

//#define RANDOM_NEXT_SAMPLE

/*!\plugin{poisson}{Poisson Disc sampler}
 *
 */
class PoissonDiscSampler : public Sampler {
public:
    PoissonDiscSampler() : Sampler(Properties()) { }

    PoissonDiscSampler(const Properties &props) : Sampler(props) {
#if 1
        size_t desiredSampleCount = props.getSize("sampleCount", 4);
        size_t i = 1;
        while (i * i < desiredSampleCount)
            ++i;
        m_sampleCount = i*i;

        if (m_sampleCount != desiredSampleCount) {
            Log(EWarn, "Sample count should be a perfect square -- rounding to " SIZE_T_FMT, m_sampleCount);
        }

        m_resolution = (int) i;
#else
        m_sampleCount = props.getSize("sampleCount", 4);
        m_resolution = (int) sqrt(m_sampleCount);
#endif

#ifndef RANDOM_NEXT_SAMPLE
        /* Dimension, up to which which stratified samples are guaranteed to be available. */
        m_maxDimension = props.getInteger("dimension", 4);

        m_samples1D = new Float*[m_maxDimension];
        m_samples2D = new Point2*[m_maxDimension];

        for (size_t i = 0; i < m_maxDimension; i++) {
            m_samples1D[i] = new Float[m_sampleCount];
            m_samples2D[i] = new Point2[m_sampleCount];
        }
#endif

        // radius
        m_radius = 1./m_resolution;
        m_radius *= 1.5; // trick
        m_random = new Random();
    }

    PoissonDiscSampler(Stream *stream, InstanceManager *manager) : Sampler(stream, manager) {
#ifndef RANDOM_NEXT_SAMPLE
        m_maxDimension = stream->readInt();

        m_samples1D = new Float*[m_maxDimension];
        m_samples2D = new Point2*[m_maxDimension];
        for (size_t i = 0; i < m_maxDimension; i++) {
            m_samples1D[i] = new Float[m_sampleCount];
            m_samples2D[i] = new Point2[m_sampleCount];
        }
#endif
        m_resolution = stream->readInt();
        m_radius = stream->readFloat();
        m_random = static_cast<Random *>(manager->getInstance(stream));
    }

    void serialize(Stream *stream, InstanceManager *manager) const {
        Sampler::serialize(stream, manager);

#ifndef RANDOM_NEXT_SAMPLE
        stream->writeInt(m_maxDimension);
#endif
        stream->writeInt(m_resolution);
        stream->writeFloat(m_radius);
        manager->serialize(stream, m_random.get());
    }

    virtual ~PoissonDiscSampler() {
#ifndef RANDOM_NEXT_SAMPLE
        for (size_t i = 0; i < m_maxDimension; i++) {
            delete[] m_samples1D[i];
            delete[] m_samples2D[i];
        }
        delete[] m_samples1D;
        delete[] m_samples2D;
#endif
    }

    ref<Sampler> clone() {
        ref<PoissonDiscSampler> sampler = new PoissonDiscSampler();
#ifndef RANDOM_NEXT_SAMPLE
        sampler->m_maxDimension = m_maxDimension;
        sampler->m_samples1D = new Float*[m_maxDimension];
        sampler->m_samples2D = new Point2*[m_maxDimension];

        for (size_t i = 0; i < m_maxDimension; i++) {
            sampler->m_samples1D[i] = new Float[m_sampleCount];
            sampler->m_samples2D[i] = new Point2[m_sampleCount];
        }
#endif
        sampler->m_sampleCount = m_sampleCount;
        sampler->m_resolution = m_resolution;
        sampler->m_radius = m_radius;
        sampler->m_random = new Random(m_random);

        //! Usefull ?
        for (size_t i = 0; i < m_req1D.size(); ++i)
            sampler->request2DArray(m_req1D[i]);

        for (size_t i = 0; i < m_req2D.size(); ++i)
            sampler->request2DArray(m_req2D[i]);

        return sampler.get();
    }

    void generate(const Point2i &) {
#ifndef RANDOM_NEXT_SAMPLE
        for (size_t i = 0; i < m_maxDimension; i++) {
            // generate random points
            m_samples1D[i][0] = m_random->nextFloat();
            m_samples2D[i][0] = Point2(
                        m_random->nextFloat(),
                        m_random->nextFloat());

            //generate all others
            for (size_t j = 1; j < m_sampleCount; ++j) {
                Float pt;
                Point2 pt2;
                bool dist_ok;

                // 1D generation
                do {
                    //generate random point
                    pt = m_random->nextFloat();
                    dist_ok = true;
                    for (size_t n = 0; n < j; ++n) {
                        //check distance on all previous points
                        if( minkowskiDistance1D(pt, m_samples1D[i][n]) < m_radius ) {
                            dist_ok = false;
                            break;
                        }
                    }
                } while ( !dist_ok );

                // add sample to the list
                m_samples1D[i][j] = pt;

                // 2D generation
                do {
                    //generate random point
                    pt2 = Point2(
                            m_random->nextFloat(),
                            m_random->nextFloat());
                    dist_ok = true;
                    for (size_t n = 0; n < j; ++n) {
                        //check distance on all previous points
                        if( minkowskiDistance2D(pt2, m_samples2D[i][n]) < m_radius ) {
                            dist_ok = false;
                            break;
                        }
                    }
                } while ( !dist_ok );

                // add sample to the list
                m_samples2D[i][j] = pt2;
            }
        }

        m_dimension1D = m_dimension2D = 0;
#endif
        for (size_t i = 0; i < m_req1D.size(); i++) {
            // generate a random point
            m_sampleArrays1D[i][0] = m_random->nextFloat();

            //generate all others
            for (size_t j = 1; j < m_sampleCount * m_req1D[i]; ++j) {
                Float pt;
                bool dist_ok;
                do {
                    //generate random point
                    pt = m_random->nextFloat();
                    dist_ok = true;
                    for (size_t n = 0; n < j; ++n) {
                        //check distance on all previous points
                        if( minkowskiDistance1D(pt, m_sampleArrays1D[i][n]) < m_radius ) {
                            dist_ok = false;
                            break;
                        }
                    }
                } while ( !dist_ok );

                // add sampler to the list
                m_sampleArrays1D[i][j] = pt;
            }
        }

        for (size_t i = 0; i < m_req2D.size(); i++) {
            // generate a random point
            m_sampleArrays2D[i][0] = Point2(
                m_random->nextFloat(),
                m_random->nextFloat());

            //generate all others
            for (size_t j = 1; j < m_sampleCount * m_req2D[i]; ++j) {
                Point2 pt;
                bool dist_ok;
                do {
                    //generate random point
                    pt = Point2(
                        m_random->nextFloat(),
                        m_random->nextFloat());
                    dist_ok = true;
                    for (size_t n = 0; n < j; ++n) {
                        //check distance on all previous points
                        if( minkowskiDistance2D(pt, m_sampleArrays2D[i][n]) < m_radius ) {
                            dist_ok = false;
                            break;
                        }
                    }
                } while ( !dist_ok );

                // add sampler to the list
                m_sampleArrays2D[i][j] = pt;
            }
        }

        m_sampleIndex = 0;
        m_dimension1DArray = m_dimension2DArray = 0;
    }

    /// Advance to the next sample
    inline void advance() {
        m_sampleIndex++;
        m_dimension1DArray = m_dimension2DArray = 0;

#ifndef RANDOM_NEXT_SAMPLE
        m_dimension1D = m_dimension2D = 0;
#endif
    }

    /// Manually set the current sample index
    inline void setSampleIndex(size_t sampleIndex) {
        m_sampleIndex = sampleIndex;
        m_dimension1DArray = m_dimension2DArray = 0;

#ifndef RANDOM_NEXT_SAMPLE
        m_dimension1D = m_dimension2D = 0;
#endif
    }

    //! Not sure about it...
    inline Float next1D() {
#ifndef RANDOM_NEXT_SAMPLE
        Assert(m_sampleIndex < m_sampleCount);
        if (m_dimension1D < m_maxDimension) {
            return m_samples1D[m_dimension1D++][m_sampleIndex];
        } else {
            return m_random->nextFloat();
        }
#else
        return m_random->nextFloat();
#endif
    }

    inline Point2 next2D() {
#ifndef RANDOM_NEXT_SAMPLE
        Assert(m_sampleIndex < m_sampleCount);
        if (m_dimension2D < m_maxDimension) {
            return m_samples2D[m_dimension2D++][m_sampleIndex];
        } else {
            return Point2(
                m_random->nextFloat(),
                m_random->nextFloat()
            );
        }
#else
        return Point2(
            m_random->nextFloat(),
            m_random->nextFloat()
        );
#endif
    }

    std::string toString() const {
        std::ostringstream oss;
        oss << "PoissonDiscSampler[" << endl
            << "  sampleCount = " << m_sampleCount << endl
            << "]";
        return oss.str();
    }

    MTS_DECLARE_CLASS()
private:
    /// Compute the Minkowski distance between Float or Point2 type
    inline Float minkowskiDistance1D(const Float a, const Float b) {
        return fabs(a - b);
    }

    inline Float minkowskiDistance2D(const Point2 a, const Point2 b) {
        return sqrt(pow(fabs(a[0] - b[0]), 2.) + pow(fabs(a[1] - b[1]), 2.));
    }

    ref<Random> m_random;
    int m_resolution;
    Float m_radius;

#ifndef RANDOM_NEXT_SAMPLE
    size_t m_maxDimension;
    Float **m_samples1D;
    Point2 **m_samples2D;
    size_t m_dimension1D, m_dimension2D;
#endif
};

MTS_IMPLEMENT_CLASS_S(PoissonDiscSampler, false, Sampler)
MTS_EXPORT_PLUGIN(PoissonDiscSampler, "Poisson Disc sampler");
MTS_NAMESPACE_END
