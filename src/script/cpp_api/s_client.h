<<<<<<< HEAD
/*
Minetest
Copyright (C) 2013 celeron55, Perttu Ahola <celeron55@gmail.com>
Copyright (C) 2017 nerzhul, Loic Blot <loic.blot@unix-experience.fr>

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
// Copyright (C) 2013 celeron55, Perttu Ahola <celeron55@gmail.com>
// Copyright (C) 2017 nerzhul, Loic Blot <loic.blot@unix-experience.fr>
>>>>>>> 5.10.0

#pragma once

#include "cpp_api/s_base.h"
#include "mapnode.h"
#include "util/string.h"
#include "util/pointedthing.h"
<<<<<<< HEAD
#include "client/content_cao.h"
#include "particles.h"
=======
>>>>>>> 5.10.0

#ifdef _CRT_MSVCP_CURRENT
#include <cstdint>
#endif

class ClientEnvironment;
struct ItemStack;
class Inventory;
struct ItemDefinition;

class ScriptApiClient : virtual public ScriptApiBase
{
public:
	// Calls when mods are loaded
	void on_mods_loaded();

	// Calls on_shutdown handlers
	void on_shutdown();

	// Chat message handlers
	bool on_sending_message(const std::string &message);
	bool on_receiving_message(const std::string &message);

	void on_damage_taken(int32_t damage_amount);
	void on_hp_modification(int32_t newhp);
<<<<<<< HEAD
	void on_death();
=======
>>>>>>> 5.10.0
	void environment_step(float dtime);
	void on_formspec_input(const std::string &formname, const StringMap &fields);

	bool on_dignode(v3s16 p, MapNode node);
	bool on_punchnode(v3s16 p, MapNode node);
	bool on_placenode(const PointedThing &pointed, const ItemDefinition &item);
	bool on_item_use(const ItemStack &item, const PointedThing &pointed);
<<<<<<< HEAD
    bool on_recieve_physics_override(float speed, float jump, float gravity, bool sneak, bool sneak_glitch, bool new_move, float speed_climb, float speed_crouch, float liquid_fluidity, 
									 float liquid_fluidity_smooth, float liquid_sink, float acceleration_default, float acceleration_air);
    bool on_spawn_particle(struct ParticleParameters param);
    void on_object_properties_change(s16 id);
    void on_object_hp_change(s16 id);
	bool on_object_add(s16 id);

	bool on_inventory_open(Inventory *inventory);

	// OtterClient
	bool on_block_data(v3s16 pos);
	bool on_player_join(std::string name);
	bool on_player_leave(std::string name);
	bool on_add_active_object(u16 id, u8 type);
	bool on_remove_active_object(u16 id);
	bool on_active_object_update_position(GenericCAO *gcao);
	bool on_active_object_step(float dtime, GenericCAO *gcao);

	v3f get_send_speed(v3f speed);

=======

	bool on_inventory_open(Inventory *inventory);

>>>>>>> 5.10.0
	void setEnv(ClientEnvironment *env);
};
