// Copyright (C) 2002-2012 Nikolaus Gebhardt
// This file is part of the "Irrlicht Engine".
// For conditions of distribution and use, see copyright notice in irrlicht.h

#pragma once

#include <vector>
#include "IMeshBuffer.h"
<<<<<<< HEAD
=======
#include "CVertexBuffer.h"
#include "CIndexBuffer.h"
>>>>>>> 5.10.0

namespace irr
{
namespace scene
{
//! Template implementation of the IMeshBuffer interface
template <class T>
<<<<<<< HEAD
class CMeshBuffer : public IMeshBuffer
=======
class CMeshBuffer final : public IMeshBuffer
>>>>>>> 5.10.0
{
public:
	//! Default constructor for empty meshbuffer
	CMeshBuffer() :
<<<<<<< HEAD
			ChangedID_Vertex(1), ChangedID_Index(1), MappingHint_Vertex(EHM_NEVER), MappingHint_Index(EHM_NEVER), HWBuffer(NULL), PrimitiveType(EPT_TRIANGLES)
=======
			PrimitiveType(EPT_TRIANGLES)
>>>>>>> 5.10.0
	{
#ifdef _DEBUG
		setDebugName("CMeshBuffer");
#endif
<<<<<<< HEAD
=======
		Vertices = new CVertexBuffer<T>();
		Indices = new SIndexBuffer();
	}

	~CMeshBuffer()
	{
		Vertices->drop();
		Indices->drop();
>>>>>>> 5.10.0
	}

	//! Get material of this meshbuffer
	/** \return Material of this buffer */
	const video::SMaterial &getMaterial() const override
	{
		return Material;
	}

	//! Get material of this meshbuffer
	/** \return Material of this buffer */
	video::SMaterial &getMaterial() override
	{
		return Material;
	}

<<<<<<< HEAD
	//! Get pointer to vertices
	/** \return Pointer to vertices. */
	const void *getVertices() const override
	{
		return Vertices.data();
	}

	//! Get pointer to vertices
	/** \return Pointer to vertices. */
	void *getVertices() override
	{
		return Vertices.data();
	}

	//! Get number of vertices
	/** \return Number of vertices. */
	u32 getVertexCount() const override
	{
		return static_cast<u32>(Vertices.size());
	}

	//! Get type of index data which is stored in this meshbuffer.
	/** \return Index type of this buffer. */
	video::E_INDEX_TYPE getIndexType() const override
	{
		return video::EIT_16BIT;
	}

	//! Get pointer to indices
	/** \return Pointer to indices. */
	const u16 *getIndices() const override
	{
		return Indices.data();
	}

	//! Get pointer to indices
	/** \return Pointer to indices. */
	u16 *getIndices() override
	{
		return Indices.data();
	}

	//! Get number of indices
	/** \return Number of indices. */
	u32 getIndexCount() const override
	{
		return static_cast<u32>(Indices.size());
=======
	const scene::IVertexBuffer *getVertexBuffer() const override
	{
		return Vertices;
	}

	scene::IVertexBuffer *getVertexBuffer() override
	{
		return Vertices;
	}

	const scene::IIndexBuffer *getIndexBuffer() const override
	{
		return Indices;
	}

	scene::IIndexBuffer *getIndexBuffer() override
	{
		return Indices;
>>>>>>> 5.10.0
	}

	//! Get the axis aligned bounding box
	/** \return Axis aligned bounding box of this buffer. */
	const core::aabbox3d<f32> &getBoundingBox() const override
	{
		return BoundingBox;
	}

	//! Set the axis aligned bounding box
	/** \param box New axis aligned bounding box for this buffer. */
	//! set user axis aligned bounding box
	void setBoundingBox(const core::aabbox3df &box) override
	{
		BoundingBox = box;
	}

	//! Recalculate the bounding box.
	/** should be called if the mesh changed. */
	void recalculateBoundingBox() override
	{
<<<<<<< HEAD
		if (!Vertices.empty()) {
			BoundingBox.reset(Vertices[0].Pos);
			const irr::u32 vsize = Vertices.size();
			for (u32 i = 1; i < vsize; ++i)
				BoundingBox.addInternalPoint(Vertices[i].Pos);
=======
		if (Vertices->getCount()) {
			BoundingBox.reset(Vertices->getPosition(0));
			const irr::u32 vsize = Vertices->getCount();
			for (u32 i = 1; i < vsize; ++i)
				BoundingBox.addInternalPoint(Vertices->getPosition(i));
>>>>>>> 5.10.0
		} else
			BoundingBox.reset(0, 0, 0);
	}

<<<<<<< HEAD
	//! Get type of vertex data stored in this buffer.
	/** \return Type of vertex data. */
	video::E_VERTEX_TYPE getVertexType() const override
	{
		return T::getType();
	}

	//! returns position of vertex i
	const core::vector3df &getPosition(u32 i) const override
	{
		return Vertices[i].Pos;
	}

	//! returns position of vertex i
	core::vector3df &getPosition(u32 i) override
	{
		return Vertices[i].Pos;
	}

	//! returns normal of vertex i
	const core::vector3df &getNormal(u32 i) const override
	{
		return Vertices[i].Normal;
	}

	//! returns normal of vertex i
	core::vector3df &getNormal(u32 i) override
	{
		return Vertices[i].Normal;
	}

	//! returns texture coord of vertex i
	const core::vector2df &getTCoords(u32 i) const override
	{
		return Vertices[i].TCoords;
	}

	//! returns texture coord of vertex i
	core::vector2df &getTCoords(u32 i) override
	{
		return Vertices[i].TCoords;
	}

=======
>>>>>>> 5.10.0
	//! Append the vertices and indices to the current buffer
	void append(const void *const vertices, u32 numVertices, const u16 *const indices, u32 numIndices) override
	{
		if (vertices == getVertices())
			return;

		const u32 vertexCount = getVertexCount();
		const u32 indexCount = getIndexCount();

		auto *vt = static_cast<const T *>(vertices);
<<<<<<< HEAD
		Vertices.insert(Vertices.end(), vt, vt + numVertices);
		for (u32 i = vertexCount; i < getVertexCount(); i++)
			BoundingBox.addInternalPoint(Vertices[i].Pos);

		Indices.insert(Indices.end(), indices, indices + numIndices);
		if (vertexCount != 0) {
			for (u32 i = indexCount; i < getIndexCount(); i++)
				Indices[i] += vertexCount;
		}
	}

	//! get the current hardware mapping hint
	E_HARDWARE_MAPPING getHardwareMappingHint_Vertex() const override
	{
		return MappingHint_Vertex;
	}

	//! get the current hardware mapping hint
	E_HARDWARE_MAPPING getHardwareMappingHint_Index() const override
	{
		return MappingHint_Index;
	}

	//! set the hardware mapping hint, for driver
	void setHardwareMappingHint(E_HARDWARE_MAPPING NewMappingHint, E_BUFFER_TYPE Buffer = EBT_VERTEX_AND_INDEX) override
	{
		if (Buffer == EBT_VERTEX_AND_INDEX || Buffer == EBT_VERTEX)
			MappingHint_Vertex = NewMappingHint;
		if (Buffer == EBT_VERTEX_AND_INDEX || Buffer == EBT_INDEX)
			MappingHint_Index = NewMappingHint;
	}

=======
		Vertices->Data.insert(Vertices->Data.end(), vt, vt + numVertices);
		for (u32 i = vertexCount; i < getVertexCount(); i++)
			BoundingBox.addInternalPoint(Vertices->getPosition(i));

		Indices->Data.insert(Indices->Data.end(), indices, indices + numIndices);
		if (vertexCount != 0) {
			for (u32 i = indexCount; i < getIndexCount(); i++)
				Indices->Data[i] += vertexCount;
		}
	}

>>>>>>> 5.10.0
	//! Describe what kind of primitive geometry is used by the meshbuffer
	void setPrimitiveType(E_PRIMITIVE_TYPE type) override
	{
		PrimitiveType = type;
	}

	//! Get the kind of primitive geometry which is used by the meshbuffer
	E_PRIMITIVE_TYPE getPrimitiveType() const override
	{
		return PrimitiveType;
	}

<<<<<<< HEAD
	//! flags the mesh as changed, reloads hardware buffers
	void setDirty(E_BUFFER_TYPE Buffer = EBT_VERTEX_AND_INDEX) override
	{
		if (Buffer == EBT_VERTEX_AND_INDEX || Buffer == EBT_VERTEX)
			++ChangedID_Vertex;
		if (Buffer == EBT_VERTEX_AND_INDEX || Buffer == EBT_INDEX)
			++ChangedID_Index;
	}

	//! Get the currently used ID for identification of changes.
	/** This shouldn't be used for anything outside the VideoDriver. */
	u32 getChangedID_Vertex() const override { return ChangedID_Vertex; }

	//! Get the currently used ID for identification of changes.
	/** This shouldn't be used for anything outside the VideoDriver. */
	u32 getChangedID_Index() const override { return ChangedID_Index; }

	void setHWBuffer(void *ptr) const override
	{
		HWBuffer = ptr;
	}

	void *getHWBuffer() const override
	{
		return HWBuffer;
	}

	u32 ChangedID_Vertex;
	u32 ChangedID_Index;

	//! hardware mapping hint
	E_HARDWARE_MAPPING MappingHint_Vertex;
	E_HARDWARE_MAPPING MappingHint_Index;
	mutable void *HWBuffer;

	//! Material for this meshbuffer.
	video::SMaterial Material;
	//! Vertices of this buffer
	std::vector<T> Vertices;
	//! Indices into the vertices of this buffer.
	std::vector<u16> Indices;
=======
	//! Material for this meshbuffer.
	video::SMaterial Material;
	//! Vertex buffer
	CVertexBuffer<T> *Vertices;
	//! Index buffer
	SIndexBuffer *Indices;
>>>>>>> 5.10.0
	//! Bounding box of this meshbuffer.
	core::aabbox3d<f32> BoundingBox;
	//! Primitive type used for rendering (triangles, lines, ...)
	E_PRIMITIVE_TYPE PrimitiveType;
};

//! Standard meshbuffer
typedef CMeshBuffer<video::S3DVertex> SMeshBuffer;
//! Meshbuffer with two texture coords per vertex, e.g. for lightmaps
typedef CMeshBuffer<video::S3DVertex2TCoords> SMeshBufferLightMap;
//! Meshbuffer with vertices having tangents stored, e.g. for normal mapping
typedef CMeshBuffer<video::S3DVertexTangents> SMeshBufferTangents;
} // end namespace scene
} // end namespace irr
