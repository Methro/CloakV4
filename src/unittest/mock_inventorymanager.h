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

#pragma once

#include "gamedef.h"
#include "inventory.h"
#include "server/serverinventorymgr.h"

class ServerEnvironment;

class MockInventoryManager : public ServerInventoryManager
{
public:
	MockInventoryManager(IGameDef *gamedef) :
		p1(gamedef->getItemDefManager()),
		p2(gamedef->getItemDefManager())
	{};

	Inventory *getInventory(const InventoryLocation &loc) override
	{
		if (loc.type == InventoryLocation::PLAYER && loc.name == "p1")
			return &p1;
		if (loc.type == InventoryLocation::PLAYER && loc.name == "p2")
			return &p2;
		return nullptr;
	}
	void setInventoryModified(const InventoryLocation &loc) override {}

	Inventory p1;
	Inventory p2;

};
