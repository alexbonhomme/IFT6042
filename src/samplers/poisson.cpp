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
#include <mitsuba/core/quadtree.h>
#include <set>

MTS_NAMESPACE_BEGIN

#define TRY_LIMIT 100
#define FACTOR 0.75

/*!\plugin{poisson}{Poisson Disc sampler}
 *
 */
class PoissonDiscSampler : public Sampler {
public:
    /**
     * @brief PoissonDiscSampler
     */
    PoissonDiscSampler() : Sampler(Properties()) {}

    /**
     * @brief PoissonDiscSampler
     * @param props
     */
    PoissonDiscSampler(const Properties &props) : Sampler(props) {
#if 0
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

        m_maxDimension = props.getInteger("dimension", 4);

        m_samples1D = new Float*[m_maxDimension];
        m_samples2D = new Point2*[m_maxDimension];

        for (size_t i = 0; i < m_maxDimension; i++) {
            m_samples1D[i] = new Float[m_sampleCount];
            m_samples2D[i] = new Point2[m_sampleCount];
        }

        m_random = new Random();
    }

    PoissonDiscSampler(Stream *stream, InstanceManager *manager) : Sampler(stream, manager) {
        m_maxDimension = stream->readInt();
        m_resolution = stream->readInt();
        m_random = static_cast<Random *>(manager->getInstance(stream));

        m_samples1D = new Float*[m_maxDimension];
        m_samples2D = new Point2*[m_maxDimension];
        for (size_t i = 0; i < m_maxDimension; i++) {
            m_samples1D[i] = new Float[m_sampleCount];
            m_samples2D[i] = new Point2[m_sampleCount];
        }
    }

    void serialize(Stream *stream, InstanceManager *manager) const {
        Sampler::serialize(stream, manager);
        stream->writeInt(m_maxDimension);
        stream->writeInt(m_resolution);
        manager->serialize(stream, m_random.get());
    }

    virtual ~PoissonDiscSampler() {
        for (size_t i = 0; i < m_maxDimension; i++) {
            delete[] m_samples1D[i];
            delete[] m_samples2D[i];
        }
        delete[] m_samples1D;
        delete[] m_samples2D;
    }

    ref<Sampler> clone() {
        ref<PoissonDiscSampler> sampler = new PoissonDiscSampler();
        sampler->m_sampleCount = m_sampleCount;
        sampler->m_resolution = m_resolution;
        sampler->m_random = new Random(m_random);

        //! Usefull ?
        for (size_t i = 0; i < m_req1D.size(); ++i)
            sampler->request2DArray(m_req1D[i]);

        for (size_t i = 0; i < m_req2D.size(); ++i)
            sampler->request2DArray(m_req2D[i]);

        sampler->m_maxDimension = m_maxDimension;
        sampler->m_samples1D = new Float*[m_maxDimension];
        sampler->m_samples2D = new Point2*[m_maxDimension];

        for (size_t i = 0; i < m_maxDimension; i++) {
            sampler->m_samples1D[i] = new Float[m_sampleCount];
            sampler->m_samples2D[i] = new Point2[m_sampleCount];
        }

        return sampler.get();
    }

    //TODO binarie tree
    void generate1D(Float* samplesArray, size_t sampleCount, Float radius) {
        Float sample;
        bool dist_ok;
        unsigned tries;
        //Float radius = 1./sqrt(sampleCount);
        //Log(EWarn, "Radius 1D: %f", radius);
        std::set<Float> samplesSet;
        std::pair< std::set<Float>::const_iterator, std::set<Float>::const_iterator > bounds;

        // generate a random points
        samplesArray[0] = m_random->nextFloat();
        samplesSet.insert(samplesArray[0]);

        // generate all others
        for (size_t i = 1; i < sampleCount; ++i) {
            tries = 0;
            do {
                // if too much trying, we narrow the circle around samples
                if( tries >= TRY_LIMIT ) {
                    radius *= FACTOR;
                    tries = 0;
                } else {
                    // generate a new random point
                    sample = m_random->nextFloat();
                }

                dist_ok = true;
                /*
                for (size_t n = 0; n < i; ++n) { //!TODO Random search ?
                    //check distance on all previous points
                    if( minkowskiDistance1D(sample, samplesArray[n]) < radius ) {
                        dist_ok = false;
                        ++tries;
                        break;
                    }
                }*/
                // get the two closest points


            } while ( !dist_ok );

            // add sample to the list
            samplesArray[i] = sample;
            samplesSet.insert(samplesArray[i]);
        }
    }

    void generate2D(Point2* samplesArray, size_t sampleCount, Float radius) {
        Point2 sample;
        bool dist_ok;
        unsigned tries;
        //Float radius = 1./sqrt(sampleCount);
        QuadTree samplesTree(AABB(0., 0., 1.));
        //Log(EWarn, "Radius 2D: %f", radius);

        // generate a random points
        samplesArray[0] = Point2(m_random->nextFloat(),
                                 m_random->nextFloat());
        samplesTree.insert(samplesArray[0]);

        // generate all others
        for (size_t i = 1; i < sampleCount; ++i) {
            tries = 0;
            do {
                // if too much trying, we narrow the circle around samples
                if( tries >= TRY_LIMIT ) {
                    radius *= FACTOR;
                    tries = 0;
                    //Log(EWarn, "Radius to large ! New radius : %f", radius);
                } else {
                    // generate a new random point
                    sample.x = m_random->nextFloat();
                    sample.y = m_random->nextFloat();
                }

                dist_ok = true;
                if( samplesTree.bNNSearch(sample, radius) ) {
                    dist_ok = false;
                    ++tries;
                }
            } while ( !dist_ok );

            // add sample to the list
            samplesArray[i] = Point2(sample.x, sample.y);
            // ...and to the tree
            samplesTree.insert(samplesArray[i]);
        }
    }

    /// Generate all samples
    void generate(const Point2i &) {
        Float radius1D = 1./(Float)m_sampleCount;
        Float radius2D = 1./sqrt((Float)m_sampleCount);
        for (size_t i = 0; i < m_maxDimension; i++) {
            generate1D(m_samples1D[i], m_sampleCount, radius1D);
            generate2D(m_samples2D[i], m_sampleCount, radius2D);
        }

        m_dimension1D = m_dimension2D = 0;

        for (size_t i = 0; i < m_req1D.size(); i++)
            generate1D(m_sampleArrays1D[i], m_sampleCount*m_req1D[i], 1./(Float)(m_sampleCount*m_req1D[i]));

        for (size_t i = 0; i < m_req2D.size(); i++)
            generate2D(m_sampleArrays2D[i], m_sampleCount*m_req2D[i], 1./sqrt((Float)m_sampleCount*m_req2D[i]));

        m_sampleIndex = 0;
        m_dimension1DArray = m_dimension2DArray = 0;
    }

    /// Advance to the next sample
    inline void advance() {
        setSampleIndex(m_sampleIndex + 1);
    }

    /// Manually set the current sample index
    inline void setSampleIndex(size_t sampleIndex) {
        m_sampleIndex = sampleIndex;
        m_dimension1DArray = m_dimension2DArray = 0;
        m_dimension1D = m_dimension2D = 0;
    }

    inline Float next1D() {
        Assert(m_sampleIndex < m_sampleCount);
        if (m_dimension1D < m_maxDimension) {
            return m_samples1D[m_dimension1D++][m_sampleIndex];
        } else {
            return m_random->nextFloat();
        }
    }

    inline Point2 next2D() {
        Assert(m_sampleIndex < m_sampleCount);
        if (m_dimension2D < m_maxDimension) {
            return m_samples2D[m_dimension2D++][m_sampleIndex];
        } else {
            return Point2(
                m_random->nextFloat(),
                m_random->nextFloat()
            );
        }
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
    ref<Random> m_random;
    int m_resolution;
    size_t m_maxDimension;
    Float** m_samples1D;
    Point2** m_samples2D;
    size_t m_dimension1D, m_dimension2D;
};

MTS_IMPLEMENT_CLASS_S(PoissonDiscSampler, false, Sampler)
MTS_EXPORT_PLUGIN(PoissonDiscSampler, "Poisson Disc sampler");
MTS_NAMESPACE_END
