<<<<<<< HEAD
/*
Minetest
Copyright (C) 2022 Minetest core developers & community

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 2.1 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/
=======
// Luanti
// SPDX-License-Identifier: LGPL-2.1-or-later
// Copyright (C) 2022 Minetest core developers & community
>>>>>>> 5.10.0

#include <server/serveractiveobject.h>

class MockServerActiveObject : public ServerActiveObject
{
public:
<<<<<<< HEAD
	MockServerActiveObject(ServerEnvironment *env = nullptr, const v3f &p = v3f()) :
=======
	MockServerActiveObject(ServerEnvironment *env = nullptr, v3f p = v3f()) :
>>>>>>> 5.10.0
		ServerActiveObject(env, p) {}

	virtual ActiveObjectType getType() const { return ACTIVEOBJECT_TYPE_TEST; }
	virtual bool getCollisionBox(aabb3f *toset) const { return false; }
	virtual bool getSelectionBox(aabb3f *toset) const { return false; }
	virtual bool collideWithObjects() const { return false; }
};
