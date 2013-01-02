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

#include <mitsuba/render/track.h>
#include <mitsuba/core/fresolver.h>
#include <mitsuba/core/fstream.h>
#include "shapegroup.h"

MTS_NAMESPACE_BEGIN

/*!\plugin{animatedinstance}{Animated geometry instance}
 * \order{10}
 * \parameters{
 *     \parameter{filename}{\String}{Filename of an animated
 *     transformation}
 *     \parameter{\Unnamed}{\ShapeGroup}{A reference to a
 *     shape group that should be instantiated}
 * }
 *
 * This plugin implements an \emph{animated} geometry instance,
 * i.e. one or more shapes that are undergoing \emph{ridgid}
 * transformations over time.
 *
 * The input file should contain a binary / serialized
 * \code{AnimatedTransform} data structure -- for details,
 * please refer to the C++ implementation of this class.
 */
class AnimatedInstance : public Shape {
public:
	AnimatedInstance(const Properties &props) : Shape(props) {
		FileResolver *fResolver = Thread::getThread()->getFileResolver();
		fs::path path = fResolver->resolve(props.getString("filename"));
		m_name = path.filename().string();

		Log(EInfo, "Loading animation track from \"%s\"", m_name.c_str());
		ref<FileStream> fs = new FileStream(path, FileStream::EReadOnly);
		m_transform = new AnimatedTransform(fs);
	}

	AnimatedInstance(Stream *stream, InstanceManager *manager)
		: Shape(stream, manager) {
		m_shapeGroup = static_cast<ShapeGroup *>(manager->getInstance(stream));
		m_transform = new AnimatedTransform(stream);
		configure();
	}

	void serialize(Stream *stream, InstanceManager *manager) const {
		Shape::serialize(stream, manager);
		manager->serialize(stream, m_shapeGroup.get());
		m_transform->serialize(stream);
	}

	void configure() {
		if (!m_shapeGroup)
			Log(EError, "A reference to a 'shapegroup' must be specified!");
		const ShapeKDTree *kdtree = m_shapeGroup->getKDTree();
		m_aabb = m_transform->getSpatialBounds(kdtree->getAABB());
	}

	AABB getAABB() const {
		return m_aabb;
	}

	std::string getName() const {
		return m_name;
	}

	Float getSurfaceArea() const {
		Log(EError, "AnimatedInstance::getSurfaceArea(): not supported!");
		return 0.0f;
	}

	void addChild(const std::string &name, ConfigurableObject *child) {
		const Class *cClass = child->getClass();
		if (cClass->getName() == "ShapeGroup") {
			m_shapeGroup = static_cast<ShapeGroup *>(child);
		} else {
			Shape::addChild(name, child);
		}
	}

	bool rayIntersect(const Ray &_ray, Float mint,
			Float maxt, Float &t, void *temp) const {
		const ShapeKDTree *kdtree = m_shapeGroup->getKDTree();
		Ray ray;
		const Transform &objectToWorld = m_transform->eval(_ray.time);
		Transform worldToObject = objectToWorld.inverse();
		worldToObject.transformAffine(_ray, ray);
		return kdtree->rayIntersect(ray, mint, maxt, t, temp);
	}

	bool rayIntersect(const Ray &_ray, Float mint, Float maxt) const {
		const ShapeKDTree *kdtree = m_shapeGroup->getKDTree();
		Ray ray;
		const Transform &objectToWorld = m_transform->eval(_ray.time);
		Transform worldToObject = objectToWorld.inverse();
		worldToObject.transformAffine(_ray, ray);
		return kdtree->rayIntersect(ray, mint, maxt);
	}

	void fillIntersectionRecord(const Ray &_ray,
		const void *temp, Intersection &its) const {
		const ShapeKDTree *kdtree = m_shapeGroup->getKDTree();
		const Transform &objectToWorld = m_transform->eval(_ray.time);

		Ray ray;
		objectToWorld.inverse()(_ray, ray);
		kdtree->fillIntersectionRecord<false>(ray, temp, its);

		its.shFrame.n = normalize(objectToWorld(its.shFrame.n));
		its.shFrame.s = normalize(objectToWorld(its.shFrame.s));
		its.shFrame.t = normalize(objectToWorld(its.shFrame.t));
		its.geoFrame = Frame(normalize(objectToWorld(its.geoFrame.n)));
		its.dpdu = objectToWorld(its.dpdu);
		its.dpdv = objectToWorld(its.dpdv);
		its.wi = normalize(its.shFrame.toLocal(-_ray.d));
		its.instance = this;
	}

	void getNormalDerivative(const Intersection &its,
		Vector &dndu, Vector &dndv, bool shadingFrame) const {
		const Transform &objectToWorld = m_transform->eval(its.time);
		its.shape->getNormalDerivative(its, dndu, dndv, shadingFrame);

		/* The following will probably be incorrect for
		non-rigid transformations */
		dndu = objectToWorld(dndu);
		dndv = objectToWorld(dndv);
	}

	size_t getPrimitiveCount() const {
		return 0;
	}

	size_t getEffectivePrimitiveCount() const {
		return m_shapeGroup->getPrimitiveCount();
	}

	MTS_DECLARE_CLASS()
private:
	ref<ShapeGroup> m_shapeGroup;
	ref<AnimatedTransform> m_transform;
	AABB m_aabb;
	std::string m_name;
};

MTS_IMPLEMENT_CLASS_S(AnimatedInstance, false, Shape)
MTS_EXPORT_PLUGIN(AnimatedInstance, "Animated instanced geometry");
MTS_NAMESPACE_END