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

#include <mitsuba/render/film.h>
#include <mitsuba/core/fstream.h>
#include <mitsuba/core/bitmap.h>
#include <mitsuba/core/statistics.h>
#include <boost/algorithm/string.hpp>
#include "banner.h"

MTS_NAMESPACE_BEGIN

/*!\plugin{hdrfilm}{High dynamic range film}
 * \order{1}
 * \parameters{
 *     \parameter{width, height}{\Integer}{
 *       Width and height of the camera sensor in pixels
 *       \default{768, 576}
 *     }
 *     \parameter{fileFormat}{\String}{
 *       Denotes the desired output file format. The options
 *       are \code{openexr} (for ILM's OpenEXR format),
 *       \code{rgbe} (for Greg Ward's RGBE format),
 *       or \code{pfm} (for the Portable Float Map format)
 *       \default{\code{openexr}}
 *     }
 *     \parameter{pixelFormat}{\String}{Specifies the desired pixel format
 *         for OpenEXR output images. The options are \code{luminance},
 *         \code{luminanceAlpha}, \code{rgb}, \code{rgba}, \code{xyz},
 *         \code{xyza}, \code{spectrum}, and \code{spectrumAlpha}. In the latter two cases,
 *         the number of written channels depends on the value assigned to
 *         \code{SPECTRUM\_SAMPLES} during compilation (see Section~\ref{sec:compiling}
 *         section for details)
 *         \default{\code{rgba}}
 *     }
 *     \parameter{componentFormat}{\String}{Specifies the desired floating
 *         point component format used for OpenEXR output. The options are
 *         \code{float16}, \code{float32}, or \code{uint32}.
 *         \default{\code{float16}}
 *     }
 *     \parameter{cropOffsetX, cropOffsetY, cropWidth, cropHeight}{\Integer}{
 *       These parameters can optionally be provided to select a sub-rectangle
 *       of the output. In this case, Mitsuba will only render the requested
 *       regions. \default{Unused}
 *     }
 *     \parameter{attachLog}{\Boolean}{Mitsuba can optionally attach
 *         the entire rendering log file as a metadata field so that this
 *         information is permanently saved.
 *         \default{\code{true}, i.e. attach it}
 *     }
 *     \parameter{banner}{\Boolean}{Include a small Mitsuba banner in the
 *         output image? \default{\code{true}}
 *     }
 *     \parameter{highQualityEdges}{\Boolean}{
 *        If set to \code{true}, regions slightly outside of the film
 *        plane will also be sampled. This may improve the image
 *        quality at the edges, especially when using very large
 *        reconstruction filters. In general, this is not needed though.
 *        \default{\code{false}, i.e. disabled}
 *     }
 *     \parameter{\Unnamed}{\RFilter}{Reconstruction filter that should
 *     be used by the film. \default{\code{gaussian}, a windowed Gaussian filter}}
 * }
 *
 * This is the default film plugin that is used when none is explicitly
 * specified. It stores the captured image as a high dynamic range OpenEXR file
 * and tries to preserve the rendering as much as possible by not performing any
 * kind of post processing, such as gamma correction---the output file
 * will record linear radiance values.
 *
 * When writing OpenEXR files, the film will either produce a luminance, luminance/alpha,
 * RGB(A), XYZ(A) tristimulus, or spectrum/spectrum-alpha-based bitmap having a
 * \code{float16}, \code{float32}, or \code{uint32}-based internal representation
 * based on the chosen parameters.
 * The default configuration is RGBA with a \code{float16} component format,
 * which is appropriate for most purposes. Note that the spectral output options
 * only make sense when using a custom build of Mitsuba that has spectral
 * rendering enabled. This is not the case for the downloadable release builds.
 *
 * The plugin can also write RLE-compressed files in the Radiance RGBE format
 * pioneered by Greg Ward (set \code{fileFormat=rgbe}), as well as the
 * Portable Float Map format (set \code{fileFormat=pfm}).
 * In the former case,
 * the \code{componentFormat} and \code{pixelFormat} parameters are ignored,
 * and the output is ``\code{float8}''-compressed RGB data.
 * PFM output is restricted to \code{float32}-valued images using the
 * \code{rgb} or \code{luminance} pixel formats.
 * Due to the superior accuracy and adoption of OpenEXR, the use of these
 * two alternative formats is discouraged however.
 *
 * When RGB output is selected, the measured spectral power distributions are
 * converted to linear RGB based on the CIE 1931 XYZ color matching curves and
 * the ITU-R Rec. BT.709-3 primaries with a D65 white point.
 *
 * \begin{xml}[caption=Instantiation of a film that writes a full-HD RGBA OpenEXR file without the Mitsuba banner]
 * <film type="hdrfilm">
 *     <integer name="width" value="1920"/>
 *     <integer name="height" value="1080"/>
 *     <boolean name="banner" value="false"/>
 * </film>
 * \end{xml}

 */
class HDRFilm : public Film {
public:
	HDRFilm(const Properties &props) : Film(props) {
		/* Should an Mitsuba banner be added to the output image? */
		m_banner = props.getBoolean("banner", true);
		/* Attach the log file as the EXR comment attribute? */
		m_attachLog = props.getBoolean("attachLog", true);

		std::string fileFormat = boost::to_lower_copy(
			props.getString("fileFormat", "openexr"));
		std::string pixelFormat = boost::to_lower_copy(
			props.getString("pixelFormat", "rgba"));
		std::string componentFormat = boost::to_lower_copy(
			props.getString("componentFormat", "float16"));

		if (fileFormat == "openexr") {
			m_fileFormat = Bitmap::EOpenEXR;
		} else if (fileFormat == "rgbe") {
			m_fileFormat = Bitmap::ERGBE;
		} else if (fileFormat == "pfm") {
			m_fileFormat = Bitmap::EPFM;
		} else {
			Log(EError, "The \"fileFormat\" parameter must either be "
				"equal to \"openexr\" or \"rgbe\"!");
		}

		if (pixelFormat == "luminance") {
			m_pixelFormat = Bitmap::ELuminance;
		} else if (pixelFormat == "luminancealpha") {
			m_pixelFormat = Bitmap::ELuminanceAlpha;
		} else if (pixelFormat == "rgb") {
			m_pixelFormat = Bitmap::ERGB;
		} else if (pixelFormat == "rgba") {
			m_pixelFormat = Bitmap::ERGBA;
		} else if (pixelFormat == "xyz") {
			m_pixelFormat = Bitmap::EXYZ;
		} else if (pixelFormat == "xyza") {
			m_pixelFormat = Bitmap::EXYZA;
		} else if (pixelFormat == "spectrum") {
			m_pixelFormat = Bitmap::ESpectrum;
		} else if (pixelFormat == "spectrumalpha") {
			m_pixelFormat = Bitmap::ESpectrumAlpha;
		} else {
			Log(EError, "The \"pixelFormat\" parameter must either be equal to "
				"\"luminance\", \"luminanceAlpha\", \"rgb\", \"rgba\", \"xyz\", \"xyza\", "
				"\"spectrum\", or \"spectrumAlpha\"!");
		}

		if (SPECTRUM_SAMPLES == 3 && (m_pixelFormat == Bitmap::ESpectrum || m_pixelFormat == Bitmap::ESpectrumAlpha))
			Log(EError, "You requested to render a spectral image, but Mitsuba is currently "
				"configured for a RGB flow (i.e. SPECTRUM_SAMPLES = 3). You will need to recompile "
				"it with a different configuration. Please see the documentation for details.");

		if (componentFormat == "float16") {
			m_componentFormat = Bitmap::EFloat16;
		} else if (componentFormat == "float32") {
			m_componentFormat = Bitmap::EFloat32;
		} else if (componentFormat == "uint32") {
			m_componentFormat = Bitmap::EUInt32;
		} else {
			Log(EError, "The \"componentFormat\" parameter must either be "
				"equal to \"float16\", \"float32\", or \"uint32\"!");
		}

		if (m_fileFormat == Bitmap::ERGBE) {
			/* RGBE output; override pixel & component format if necessary */
			if (m_pixelFormat != Bitmap::ERGB) {
				Log(EWarn, "The RGBE format only supports pixelFormat=\"rgb\". Overriding..");
				m_pixelFormat = Bitmap::ERGB;
			}
			if (m_componentFormat != Bitmap::EFloat32) {
				Log(EWarn, "The RGBE format only supports componentFormat=\"float32\". Overriding..");
				m_componentFormat = Bitmap::EFloat32;
			}
		} else if (m_fileFormat == Bitmap::EPFM) {
			/* PFM output; override pixel & component format if necessary */
			if (m_pixelFormat != Bitmap::ERGB && m_pixelFormat != Bitmap::ELuminance) {
				Log(EWarn, "The PFM format only supports pixelFormat=\"rgb\" or \"luminance\"."
					" Overriding (setting to \"rgb\")..");
				m_pixelFormat = Bitmap::ERGB;
			}
			if (m_componentFormat != Bitmap::EFloat32) {
				Log(EWarn, "The PFM format only supports componentFormat=\"float32\". Overriding..");
				m_componentFormat = Bitmap::EFloat32;
			}

		}

		m_storage = new ImageBlock(Bitmap::ESpectrumAlphaWeight, m_cropSize);
	}

	HDRFilm(Stream *stream, InstanceManager *manager)
		: Film(stream, manager) {
		m_banner = stream->readBool();
		m_attachLog = stream->readBool();
		m_fileFormat = (Bitmap::EFileFormat) stream->readUInt();
		m_pixelFormat = (Bitmap::EPixelFormat) stream->readUInt();
		m_componentFormat = (Bitmap::EComponentFormat) stream->readUInt();
	}

	void serialize(Stream *stream, InstanceManager *manager) const {
		Film::serialize(stream, manager);
		stream->writeBool(m_banner);
		stream->writeBool(m_attachLog);
		stream->writeUInt(m_fileFormat);
		stream->writeUInt(m_pixelFormat);
		stream->writeUInt(m_componentFormat);
	}

	void clear() {
		m_storage->clear();
	}

	void put(const ImageBlock *block) {
		m_storage->put(block);
	}

	void setBitmap(const Bitmap *bitmap, Float multiplier) {
		bitmap->convert(m_storage->getBitmap(), multiplier);
	}

	void addBitmap(const Bitmap *bitmap, Float multiplier) {
		/* Currently, only accumulating spectrum-valued floating point images
		   is supported. This function basically just exists to support the
		   somewhat peculiar film updates done by BDPT */

		Vector2i size = bitmap->getSize();
		if (bitmap->getPixelFormat() != Bitmap::ESpectrum ||
			bitmap->getComponentFormat() != Bitmap::EFloat ||
			bitmap->getGamma() != 1.0f ||
			size != m_storage->getSize()) {
			Log(EError, "addBitmap(): Unsupported bitmap format!");
		}

		size_t nPixels = (size_t) size.x * (size_t) size.y;
		const Float *source = bitmap->getFloatData();
		Float *target = m_storage->getBitmap()->getFloatData();
		for (size_t i=0; i<nPixels; ++i) {
			Float weight = target[SPECTRUM_SAMPLES + 1];
			if (weight == 0)
				weight = target[SPECTRUM_SAMPLES + 1] = 1;
			weight *= multiplier;
			for (size_t j=0; j<SPECTRUM_SAMPLES; ++j)
				*target++ += *source++ * weight;
			target += 2;
		}
	}

	bool develop(const Point2i &sourceOffset, const Vector2i &size,
			const Point2i &targetOffset, Bitmap *target) const {
		const Bitmap *source = m_storage->getBitmap();
		const FormatConverter *cvt = FormatConverter::getInstance(
			std::make_pair(Bitmap::EFloat, target->getComponentFormat())
		);

		size_t sourceBpp = source->getBytesPerPixel();
		size_t targetBpp = target->getBytesPerPixel();

		const uint8_t *sourceData = source->getUInt8Data()
			+ (sourceOffset.x + sourceOffset.y * source->getWidth()) * sourceBpp;
		uint8_t *targetData = target->getUInt8Data()
			+ (targetOffset.x + targetOffset.y * target->getWidth()) * targetBpp;

		if (size.x == m_cropSize.x) {
			/* Develop a connected part of the underlying buffer */
			cvt->convert(source->getPixelFormat(), 1.0f, sourceData,
				target->getPixelFormat(), target->getGamma(), targetData,
				size.x*size.y);
		} else {
			/* Develop a rectangular subregion */
			for (int i=0; i<size.y; ++i) {
				cvt->convert(source->getPixelFormat(), 1.0f, sourceData,
					target->getPixelFormat(), target->getGamma(), targetData,
					size.x);

				sourceData += source->getWidth() * sourceBpp;
				targetData += target->getWidth() * targetBpp;
			}
		}

		return true;
	}

	void setDestinationFile(const fs::path &destFile, uint32_t blockSize) {
		m_destFile = destFile;
	}

	void develop() {
		Log(EDebug, "Developing film ..");

		ref<Bitmap> bitmap = m_storage->getBitmap()->convert(
			m_pixelFormat, m_componentFormat);

		if (m_banner && m_cropSize.x > bannerWidth+5 && m_cropSize.y > bannerHeight + 5) {
			int xoffs = m_cropSize.x - bannerWidth - 5,
			    yoffs = m_cropSize.y - bannerHeight - 5;
			for (int y=0; y<bannerHeight; y++) {
				for (int x=0; x<bannerWidth; x++) {
					if (banner[x+y*bannerWidth])
						continue;
					bitmap->setPixel(Point2i(x+xoffs, y+yoffs), Spectrum(1024));
				}
			}
		}

		fs::path filename = m_destFile;
		std::string extension = boost::to_lower_copy(filename.extension().string());
		std::string properExtension = (m_fileFormat == Bitmap::EOpenEXR) ? ".exr" : ".rgbe";
		if (extension != properExtension)
			filename.replace_extension(properExtension);

		Log(EInfo, "Writing image to \"%s\" ..", filename.string().c_str());
		ref<FileStream> stream = new FileStream(filename, FileStream::ETruncWrite);

		/* Attach the log file to the image if this is requested */
		Logger *logger = Thread::getThread()->getLogger();
		std::string log;
		if (m_attachLog && logger->readLog(log)) {
			log += "\n\n";
			log += Statistics::getInstance()->getStats();
			bitmap->setString("log", log);
		}

		bitmap->write(m_fileFormat, stream);
	}

	bool destinationExists(const fs::path &baseName) const {
		fs::path filename = baseName;
		std::string extension = (m_fileFormat == Bitmap::EOpenEXR) ? ".exr" : ".rgbe";
		if (boost::to_lower_copy(filename.extension().string()) != extension)
			filename.replace_extension(extension);
		return fs::exists(filename);
	}

	std::string toString() const {
		std::ostringstream oss;
		oss << "HDRFilm[" << endl
			<< "  size = " << m_size.toString() << "," << endl
			<< "  fileFormat = " << m_fileFormat << "," << endl
			<< "  pixelFormat = " << m_pixelFormat << "," << endl
			<< "  componentFormat = " << m_componentFormat << "," << endl
			<< "  cropOffset = " << m_cropOffset.toString() << "," << endl
			<< "  cropSize = " << m_cropSize.toString() << "," << endl
			<< "  banner = " << m_banner << "," << endl
			<< "  filter = " << indent(m_filter->toString()) << endl
			<< "]";
		return oss.str();
	}

	MTS_DECLARE_CLASS()
protected:
	Bitmap::EFileFormat m_fileFormat;
	Bitmap::EPixelFormat m_pixelFormat;
	Bitmap::EComponentFormat m_componentFormat;
	bool m_banner;
	bool m_attachLog;
	fs::path m_destFile;
	ref<ImageBlock> m_storage;
};

MTS_IMPLEMENT_CLASS_S(HDRFilm, false, Film)
MTS_EXPORT_PLUGIN(HDRFilm, "High dynamic range film");
MTS_NAMESPACE_END