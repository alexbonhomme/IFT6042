#include <mitsuba/render/sampler.h>

MTS_NAMESPACE_BEGIN

/*!\plugin{poisson}{Poisson Disc sampler}
 * \order{7}
 * \parameters{
 *     \parameter{sampleCount}{\Integer}{
 *        Number of samples per pixel \default{4}
 *     }
 *     \parameter{scramble}{\Integer}{
 *        This plugin can operate in one of three scrambling modes:
 *        \begin{enumerate}[(i)]
 *        \item When set to \code{0}, the implementation will provide the standard Halton sequence.
 *
 *        \item When set to \code{-1}, the implementation will compute
 *        a scrambled variant of the Halton sequence based on permutations by
 *        Faure \cite{Faure1992Good}, which has better equidistribution properties
 *        in high dimensions.
 *
 *        \item When set to a value greater than one, a random permutation is chosen based
 *        on this number. This is useful to break up temporally coherent noise when rendering
 *        the frames of an animation --- in this case, simply set the parameter to the current frame index.
 *        \end{enumerate}
 *        Default: \code{-1}, i.e. use the Faure permutations. Note that permutations rely on a
 *        precomputed table that consumes approximately 7 MiB of additional memory at run time.
 *     }
 * }
  * \renderings{
 *     \unframedrendering{Projection of the first 1024 points
 *     of the Faure-scrambled Halton seq. onto the first two dimensions.}{sampler_halton_scrambled_0}
 *     \unframedrendering{Projection of the first 1024 points
 *     of the Faure-scrambled Halton seq. onto the 32th and 33th dim.}{sampler_halton_scrambled_32}
 * }
 * This plugin implements a Quasi-Monte Carlo (QMC) sample generator based on the
 * Halton sequence. QMC number sequences are designed to reduce sample clumping
 * across integration dimensions, which can lead to a higher order of
 * convergence in renderings. Because of the deterministic character of the samples,
 * errors will manifest as grid or moir\'e patterns rather than random noise, but
 * these diminish as the number of samples is increased.
 *
 * The Halton sequence in particular provides a very high quality point set that unfortunately
 * becomes increasingly correlated in higher dimensions. To ameliorate this problem, the Halton
 * points are usually combined with a scrambling permutation, and this is also the default.
 * Because everything that happens inside this sampler is completely deterministic and
 * independent of operating system scheduling behavior, subsequent runs of Mitsuba will always
 * compute the same image, and this even holds when rendering with multiple threads
 * and/or machines.
  * \renderings{
 *     \unframedrendering{A projection of the first 1024 points
 *     of the \emph{original} Halton sequence onto the first two dimensions, obtained by
 *     setting \code{scramble=0}}{sampler_halton_nonscrambled_0}
 *     \unframedrendering{A projection of the first 1024 points
 *     of the \emph{original} Halton sequence onto the 32th and 33th dimensions.
 *     Note the strong correlation -- a scrambled sequence is usually preferred to avoid this problem.}{sampler_halton_nonscrambled_32}
 * }
 * \renderings{
 *     \unframedrendering{A projection of the first 1024 points
 *     of a randomly scrambled Halton sequence onto the first two dimensions (\code{scramble=1}).}{sampler_halton_rscrambled_0}
 *     \unframedrendering{A projection of the first 1024 points
 *     of a randomly scrambled Halton sequence onto the 32th and 33th dimensions.}{sampler_halton_rscrambled_32}
 * }
*
 * By default, the implementation provides a scrambled variant of the Halton sequence based
 * on permutations by Faure \cite{Faure1992Good} that has better equidistribution properties
 * in high dimensions, but this can be changed using the \code{scramble} parameter.
 * Internally, the plugin uses a table of prime numbers to provide elements
 * of the Halton sequence up to a dimension of 1024. Because of this upper bound,
 * the maximum path depth of the integrator must be limited (e.g. to 100), or
 * rendering might fail with the following error message: \emph{Lookup dimension
 * exceeds the prime number table size! You may have to reduce the 'maxDepth'
 * parameter of your integrator}.
 *
 * To support bucket-based renderings, the Halton sequence is internally enumerated
 * using a scheme proposed by Gr\"unschlo\ss\ et al. \cite{Grunschloss2010Enumerating};
 * the implementation in Mitsuba is based on a Python script by the authors of
 * this paper.
 *
 * \remarks{
 *   \item This sampler is incompatible with Metropolis Light Transport (all variants).
 *   It interoperates poorly with Bidirectional Path Tracing and Energy Redistribution
 *   Path Tracing, hence these should not be used together. The \pluginref{sobol} QMC
 *   sequence is an alternative for the latter two cases, and \pluginref{ldsampler}
 *   works as well.
 * }
 */
class PoissonDiscSampler : public Sampler {
public:
    PoissonDiscSampler() : Sampler(Properties()) { }

    PoissonDiscSampler(const Properties &props) : Sampler(props) {
        /* Number of samples per pixel when used with a sampling-based integrator */
        m_sampleCount = props.getSize("sampleCount", 4);
        m_random = new Random();

        size_t desiredSampleCount = props.getSize("sampleCount", 4);
        size_t i = 1;
        while (i * i < desiredSampleCount)
            ++i;
        m_sampleCount = i*i;

        if (m_sampleCount != desiredSampleCount) {
            Log(EWarn, "Sample count should be a perfect square -- rounding to " SIZE_T_FMT, m_sampleCount);
        }

        m_resolution = (int) i;

        // radius
        m_radius = 1./m_resolution;
        m_radius *= 1.5; // trick
    }

    PoissonDiscSampler(Stream *stream, InstanceManager *manager) : Sampler(stream, manager) {
        m_random = static_cast<Random *>(manager->getInstance(stream));
    }

    void serialize(Stream *stream, InstanceManager *manager) const {
        Sampler::serialize(stream, manager);
        manager->serialize(stream, m_random.get());
    }

    ref<Sampler> clone() {
        ref<PoissonDiscSampler> sampler = new PoissonDiscSampler();
        sampler->m_sampleCount = m_sampleCount;
        sampler->m_random = new Random(m_random);
        for (size_t i=0; i<m_req1D.size(); ++i)
            sampler->request2DArray(m_req1D[i]);
        for (size_t i=0; i<m_req2D.size(); ++i)
            sampler->request2DArray(m_req2D[i]);
        return sampler.get();
    }

    void generate(const Point2i &) {
        for (size_t i=0; i<m_req1D.size(); i++) {
            for (size_t j=0; j<m_sampleCount * m_req1D[i]; ++j) {
                // generate a random point
                m_sampleArrays1D[i][0] = m_random->nextFloat();

                //generate all others
                for (size_t j=1; j<m_sampleCount * m_req2D[i]; ++j) {
                    Float pt;
                    bool dist_ok;
                    do {
                        //generate random point
                        pt = m_random->nextFloat();

                        dist_ok=true;
                        for (size_t z = 0; z < j; ++z) {
                            //check distance on all previous points

                            if( minkowskiDistance1D(pt, m_sampleArrays1D[i][z]) < m_radius ) {
                                //printf("dist %f - min %f\n", Minkowski_distance_2d(pt, mSamples[z]), mCellSize);
                                dist_ok=false;
                                break;
                            }
                        }
                    } while ( !dist_ok );

                    // add sampler to the list
                    m_sampleArrays1D[i][j] = pt;
                }
            }
        }

        for (size_t i=0; i<m_req2D.size(); i++) {
            // generate a random point
            m_sampleArrays2D[i][0] = Point2(
                m_random->nextFloat(),
                m_random->nextFloat());

            //generate all others
            for (size_t j=1; j<m_sampleCount * m_req2D[i]; ++j) {
                Point2 pt;
                bool dist_ok;
                do {
                    //generate random point
                    pt = Point2(
                        m_random->nextFloat(),
                        m_random->nextFloat());

                    dist_ok=true;
                    for (size_t z = 0; z < j; ++z) {
                        //check distance on all previous points

                        if( minkowskiDistance2D(pt, m_sampleArrays2D[i][z]) < m_radius ) {
                            //printf("dist %f - min %f\n", Minkowski_distance_2d(pt, mSamples[z]), mCellSize);
                            dist_ok=false;
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

    inline float minkowskiDistance1D(Float x_a, Float x_b){
        return fabs(x_a - x_b);
    }

    inline float minkowskiDistance2D(Point2 x_a, Point2 x_b){
        return sqrt(pow(fabs(x_a[0] - x_b[0]), 2.) + pow(fabs(x_a[1] - x_b[1]), 2.));
    }

    Float next1D() {
        //TODO
        return m_random->nextFloat();
    }

    Point2 next2D() {
        //TODO
        return Point2(
            m_random->nextFloat(),
            m_random->nextFloat());
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
    Float m_radius;
};

MTS_IMPLEMENT_CLASS_S(PoissonDiscSampler, false, Sampler)
MTS_EXPORT_PLUGIN(PoissonDiscSampler, "Poisson Disc sampler");
MTS_NAMESPACE_END
