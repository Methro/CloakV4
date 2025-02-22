// Copyright (C) 2002-2012 Nikolaus Gebhardt
// This file is part of the "Irrlicht Engine".
// For conditions of distribution and use, see copyright notice in irrlicht.h

#pragma once

#include "IMeshBuffer.h"
<<<<<<< HEAD
#include "S3DVertex.h"
#include "irrArray.h"
=======
#include "CVertexBuffer.h"
#include "CIndexBuffer.h"
#include "S3DVertex.h"
>>>>>>> 5.10.0

namespace irr
{
namespace scene
{

//! A mesh buffer able to choose between S3DVertex2TCoords, S3DVertex and S3DVertexTangents at runtime
<<<<<<< HEAD
struct SSkinMeshBuffer : public IMeshBuffer
{
	//! Default constructor
	SSkinMeshBuffer(video::E_VERTEX_TYPE vt = video::EVT_STANDARD) :
			ChangedID_Vertex(1), ChangedID_Index(1), VertexType(vt),
			PrimitiveType(EPT_TRIANGLES), HWBuffer(nullptr),
			MappingHint_Vertex(EHM_NEVER), MappingHint_Index(EHM_NEVER),
			BoundingBoxNeedsRecalculated(true)
	{}
=======
struct SSkinMeshBuffer final : public IMeshBuffer
{
	//! Default constructor
	SSkinMeshBuffer(video::E_VERTEX_TYPE vt = video::EVT_STANDARD) :
			VertexType(vt), PrimitiveType(EPT_TRIANGLES),
			BoundingBoxNeedsRecalculated(true)
	{
#ifdef _DEBUG
		setDebugName("SSkinMeshBuffer");
#endif
		Vertices_Tangents = new SVertexBufferTangents();
		Vertices_2TCoords = new SVertexBufferLightMap();
		Vertices_Standard = new SVertexBuffer();
		Indices = new SIndexBuffer();
	}
>>>>>>> 5.10.0

	//! Constructor for standard vertices
	SSkinMeshBuffer(std::vector<video::S3DVertex> &&vertices, std::vector<u16> &&indices) :
			SSkinMeshBuffer()
	{
<<<<<<< HEAD
		Vertices_Standard = std::move(vertices);
		Indices = std::move(indices);
=======
		Vertices_Standard->Data = std::move(vertices);
		Indices->Data = std::move(indices);
	}

	~SSkinMeshBuffer()
	{
		Vertices_Tangents->drop();
		Vertices_2TCoords->drop();
		Vertices_Standard->drop();
		Indices->drop();
>>>>>>> 5.10.0
	}

	//! Get Material of this buffer.
	const video::SMaterial &getMaterial() const override
	{
		return Material;
	}

	//! Get Material of this buffer.
	video::SMaterial &getMaterial() override
	{
		return Material;
	}

<<<<<<< HEAD
	//! Get standard vertex at given index
	virtual video::S3DVertex *getVertex(u32 index)
	{
		switch (VertexType) {
		case video::EVT_2TCOORDS:
			return (video::S3DVertex *)&Vertices_2TCoords[index];
		case video::EVT_TANGENTS:
			return (video::S3DVertex *)&Vertices_Tangents[index];
		default:
			return &Vertices_Standard[index];
		}
	}

	//! Get pointer to vertex array
	const void *getVertices() const override
	{
		switch (VertexType) {
		case video::EVT_2TCOORDS:
			return Vertices_2TCoords.data();
		case video::EVT_TANGENTS:
			return Vertices_Tangents.data();
		default:
			return Vertices_Standard.data();
		}
	}

	//! Get pointer to vertex array
	void *getVertices() override
	{
		switch (VertexType) {
		case video::EVT_2TCOORDS:
			return Vertices_2TCoords.data();
		case video::EVT_TANGENTS:
			return Vertices_Tangents.data();
		default:
			return Vertices_Standard.data();
		}
	}

	//! Get vertex count
	u32 getVertexCount() const override
	{
		switch (VertexType) {
		case video::EVT_2TCOORDS:
			return static_cast<u32>(Vertices_2TCoords.size());
		case video::EVT_TANGENTS:
			return static_cast<u32>(Vertices_Tangents.size());
		default:
			return static_cast<u32>(Vertices_Standard.size());
		}
	}

	//! Get type of index data which is stored in this meshbuffer.
	/** \return Index type of this buffer. */
	video::E_INDEX_TYPE getIndexType() const override
	{
		return video::EIT_16BIT;
	}

	//! Get pointer to index array
	const u16 *getIndices() const override
	{
		return Indices.data();
	}

	//! Get pointer to index array
	u16 *getIndices() override
	{
		return Indices.data();
	}

	//! Get index count
	u32 getIndexCount() const override
	{
		return static_cast<u32>(Indices.size());
	}

=======
	const scene::IVertexBuffer *getVertexBuffer() const override
	{
		switch (VertexType) {
		case video::EVT_2TCOORDS:
			return Vertices_2TCoords;
		case video::EVT_TANGENTS:
			return Vertices_Tangents;
		default:
			return Vertices_Standard;
		}
	}

	scene::IVertexBuffer *getVertexBuffer() override
	{
		switch (VertexType) {
		case video::EVT_2TCOORDS:
			return Vertices_2TCoords;
		case video::EVT_TANGENTS:
			return Vertices_Tangents;
		default:
			return Vertices_Standard;
		}
	}

	const scene::IIndexBuffer *getIndexBuffer() const override
	{
		return Indices;
	}

	scene::IIndexBuffer *getIndexBuffer() override
	{
		return Indices;
	}

	//! Get standard vertex at given index
	virtual video::S3DVertex *getVertex(u32 index)
	{
		switch (VertexType) {
		case video::EVT_2TCOORDS:
			return &Vertices_2TCoords->Data[index];
		case video::EVT_TANGENTS:
			return &Vertices_Tangents->Data[index];
		default:
			return &Vertices_Standard->Data[index];
		}
	}

>>>>>>> 5.10.0
	//! Get bounding box
	const core::aabbox3d<f32> &getBoundingBox() const override
	{
		return BoundingBox;
	}

	//! Set bounding box
	void setBoundingBox(const core::aabbox3df &box) override
	{
		BoundingBox = box;
	}

<<<<<<< HEAD
=======
private:
	template <typename T> void recalculateBoundingBox(const CVertexBuffer<T> *buf)
	{
		if (!buf->getCount()) {
			BoundingBox.reset(0, 0, 0);
		} else {
			auto &vertices = buf->Data;
			BoundingBox.reset(vertices[0].Pos);
			for (size_t i = 1; i < vertices.size(); ++i)
				BoundingBox.addInternalPoint(vertices[i].Pos);
		}
	}

	template <typename T1, typename T2> static void copyVertex(const T1 &src, T2 &dst)
	{
		dst.Pos = src.Pos;
		dst.Normal = src.Normal;
		dst.Color = src.Color;
		dst.TCoords = src.TCoords;
	}
public:

>>>>>>> 5.10.0
	//! Recalculate bounding box
	void recalculateBoundingBox() override
	{
		if (!BoundingBoxNeedsRecalculated)
			return;

		BoundingBoxNeedsRecalculated = false;

		switch (VertexType) {
		case video::EVT_STANDARD: {
<<<<<<< HEAD
			if (Vertices_Standard.empty())
				BoundingBox.reset(0, 0, 0);
			else {
				BoundingBox.reset(Vertices_Standard[0].Pos);
				for (size_t i = 1; i < Vertices_Standard.size(); ++i)
					BoundingBox.addInternalPoint(Vertices_Standard[i].Pos);
			}
			break;
		}
		case video::EVT_2TCOORDS: {
			if (Vertices_2TCoords.empty())
				BoundingBox.reset(0, 0, 0);
			else {
				BoundingBox.reset(Vertices_2TCoords[0].Pos);
				for (size_t i = 1; i < Vertices_2TCoords.size(); ++i)
					BoundingBox.addInternalPoint(Vertices_2TCoords[i].Pos);
			}
			break;
		}
		case video::EVT_TANGENTS: {
			if (Vertices_Tangents.empty())
				BoundingBox.reset(0, 0, 0);
			else {
				BoundingBox.reset(Vertices_Tangents[0].Pos);
				for (size_t i = 1; i < Vertices_Tangents.size(); ++i)
					BoundingBox.addInternalPoint(Vertices_Tangents[i].Pos);
			}
=======
			recalculateBoundingBox(Vertices_Standard);
			break;
		}
		case video::EVT_2TCOORDS: {
			recalculateBoundingBox(Vertices_2TCoords);
			break;
		}
		case video::EVT_TANGENTS: {
			recalculateBoundingBox(Vertices_Tangents);
>>>>>>> 5.10.0
			break;
		}
		}
	}

<<<<<<< HEAD
	//! Get vertex type
	video::E_VERTEX_TYPE getVertexType() const override
	{
		return VertexType;
	}

=======
>>>>>>> 5.10.0
	//! Convert to 2tcoords vertex type
	void convertTo2TCoords()
	{
		if (VertexType == video::EVT_STANDARD) {
<<<<<<< HEAD
			for (const auto &Vertex_Standard : Vertices_Standard) {
				video::S3DVertex2TCoords Vertex;
				Vertex.Color = Vertex_Standard.Color;
				Vertex.Pos = Vertex_Standard.Pos;
				Vertex.Normal = Vertex_Standard.Normal;
				Vertex.TCoords = Vertex_Standard.TCoords;
				Vertices_2TCoords.push_back(Vertex);
			}
			Vertices_Standard.clear();
=======
			video::S3DVertex2TCoords Vertex;
			for (const auto &Vertex_Standard : Vertices_Standard->Data) {
				copyVertex(Vertex_Standard, Vertex);
				Vertices_2TCoords->Data.push_back(Vertex);
			}
			Vertices_Standard->Data.clear();
>>>>>>> 5.10.0
			VertexType = video::EVT_2TCOORDS;
		}
	}

	//! Convert to tangents vertex type
	void convertToTangents()
	{
		if (VertexType == video::EVT_STANDARD) {
<<<<<<< HEAD
			for (const auto &Vertex_Standard : Vertices_Standard) {
				video::S3DVertexTangents Vertex;
				Vertex.Color = Vertex_Standard.Color;
				Vertex.Pos = Vertex_Standard.Pos;
				Vertex.Normal = Vertex_Standard.Normal;
				Vertex.TCoords = Vertex_Standard.TCoords;
				Vertices_Tangents.push_back(Vertex);
			}
			Vertices_Standard.clear();
			VertexType = video::EVT_TANGENTS;
		} else if (VertexType == video::EVT_2TCOORDS) {
			for (const auto &Vertex_2TCoords : Vertices_2TCoords) {
				video::S3DVertexTangents Vertex;
				Vertex.Color = Vertex_2TCoords.Color;
				Vertex.Pos = Vertex_2TCoords.Pos;
				Vertex.Normal = Vertex_2TCoords.Normal;
				Vertex.TCoords = Vertex_2TCoords.TCoords;
				Vertices_Tangents.push_back(Vertex);
			}
			Vertices_2TCoords.clear();
=======
			video::S3DVertexTangents Vertex;
			for (const auto &Vertex_Standard : Vertices_Standard->Data) {
				copyVertex(Vertex_Standard, Vertex);
				Vertices_Tangents->Data.push_back(Vertex);
			}
			Vertices_Standard->Data.clear();
			VertexType = video::EVT_TANGENTS;
		} else if (VertexType == video::EVT_2TCOORDS) {
			video::S3DVertexTangents Vertex;
			for (const auto &Vertex_2TCoords : Vertices_2TCoords->Data) {
				copyVertex(Vertex_2TCoords, Vertex);
				Vertices_Tangents->Data.push_back(Vertex);
			}
			Vertices_2TCoords->Data.clear();
>>>>>>> 5.10.0
			VertexType = video::EVT_TANGENTS;
		}
	}

<<<<<<< HEAD
	//! returns position of vertex i
	const core::vector3df &getPosition(u32 i) const override
	{
		switch (VertexType) {
		case video::EVT_2TCOORDS:
			return Vertices_2TCoords[i].Pos;
		case video::EVT_TANGENTS:
			return Vertices_Tangents[i].Pos;
		default:
			return Vertices_Standard[i].Pos;
		}
	}

	//! returns position of vertex i
	core::vector3df &getPosition(u32 i) override
	{
		switch (VertexType) {
		case video::EVT_2TCOORDS:
			return Vertices_2TCoords[i].Pos;
		case video::EVT_TANGENTS:
			return Vertices_Tangents[i].Pos;
		default:
			return Vertices_Standard[i].Pos;
		}
	}

	//! returns normal of vertex i
	const core::vector3df &getNormal(u32 i) const override
	{
		switch (VertexType) {
		case video::EVT_2TCOORDS:
			return Vertices_2TCoords[i].Normal;
		case video::EVT_TANGENTS:
			return Vertices_Tangents[i].Normal;
		default:
			return Vertices_Standard[i].Normal;
		}
	}

	//! returns normal of vertex i
	core::vector3df &getNormal(u32 i) override
	{
		switch (VertexType) {
		case video::EVT_2TCOORDS:
			return Vertices_2TCoords[i].Normal;
		case video::EVT_TANGENTS:
			return Vertices_Tangents[i].Normal;
		default:
			return Vertices_Standard[i].Normal;
		}
	}

	//! returns texture coords of vertex i
	const core::vector2df &getTCoords(u32 i) const override
	{
		switch (VertexType) {
		case video::EVT_2TCOORDS:
			return Vertices_2TCoords[i].TCoords;
		case video::EVT_TANGENTS:
			return Vertices_Tangents[i].TCoords;
		default:
			return Vertices_Standard[i].TCoords;
		}
	}

	//! returns texture coords of vertex i
	core::vector2df &getTCoords(u32 i) override
	{
		switch (VertexType) {
		case video::EVT_2TCOORDS:
			return Vertices_2TCoords[i].TCoords;
		case video::EVT_TANGENTS:
			return Vertices_Tangents[i].TCoords;
		default:
			return Vertices_Standard[i].TCoords;
		}
	}

=======
>>>>>>> 5.10.0
	//! append the vertices and indices to the current buffer
	void append(const void *const vertices, u32 numVertices, const u16 *const indices, u32 numIndices) override
	{
		_IRR_DEBUG_BREAK_IF(true);
	}

<<<<<<< HEAD
	//! get the current hardware mapping hint for vertex buffers
	E_HARDWARE_MAPPING getHardwareMappingHint_Vertex() const override
	{
		return MappingHint_Vertex;
	}

	//! get the current hardware mapping hint for index buffers
	E_HARDWARE_MAPPING getHardwareMappingHint_Index() const override
	{
		return MappingHint_Index;
	}

	//! set the hardware mapping hint, for driver
	void setHardwareMappingHint(E_HARDWARE_MAPPING NewMappingHint, E_BUFFER_TYPE Buffer = EBT_VERTEX_AND_INDEX) override
	{
		if (Buffer == EBT_VERTEX)
			MappingHint_Vertex = NewMappingHint;
		else if (Buffer == EBT_INDEX)
			MappingHint_Index = NewMappingHint;
		else if (Buffer == EBT_VERTEX_AND_INDEX) {
			MappingHint_Vertex = NewMappingHint;
			MappingHint_Index = NewMappingHint;
		}
	}

=======
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

	u32 getChangedID_Vertex() const override { return ChangedID_Vertex; }

	u32 getChangedID_Index() const override { return ChangedID_Index; }

	void setHWBuffer(void *ptr) const override
	{
		HWBuffer = ptr;
	}

	void *getHWBuffer() const override
	{
		return HWBuffer;
	}

	//! Call this after changing the positions of any vertex.
	void boundingBoxNeedsRecalculated(void) { BoundingBoxNeedsRecalculated = true; }

	std::vector<video::S3DVertexTangents> Vertices_Tangents;
	std::vector<video::S3DVertex2TCoords> Vertices_2TCoords;
	std::vector<video::S3DVertex> Vertices_Standard;
	std::vector<u16> Indices;

	u32 ChangedID_Vertex;
	u32 ChangedID_Index;

	// ISkinnedMesh::SJoint *AttachedJoint;
=======
	//! Call this after changing the positions of any vertex.
	void boundingBoxNeedsRecalculated(void) { BoundingBoxNeedsRecalculated = true; }

	SVertexBufferTangents *Vertices_Tangents;
	SVertexBufferLightMap *Vertices_2TCoords;
	SVertexBuffer *Vertices_Standard;
	SIndexBuffer *Indices;

>>>>>>> 5.10.0
	core::matrix4 Transformation;

	video::SMaterial Material;
	video::E_VERTEX_TYPE VertexType;

	core::aabbox3d<f32> BoundingBox;

	//! Primitive type used for rendering (triangles, lines, ...)
	E_PRIMITIVE_TYPE PrimitiveType;

<<<<<<< HEAD
	mutable void *HWBuffer;

	// hardware mapping hint
	E_HARDWARE_MAPPING MappingHint_Vertex : 3;
	E_HARDWARE_MAPPING MappingHint_Index : 3;

	bool BoundingBoxNeedsRecalculated : 1;
=======
	bool BoundingBoxNeedsRecalculated;
>>>>>>> 5.10.0
};

} // end namespace scene
} // end namespace irr
