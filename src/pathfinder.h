<<<<<<< HEAD
/*
Minetest
Copyright (C) 2013 sapier, sapier at gmx dot net

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
// Copyright (C) 2013 sapier, sapier at gmx dot net
>>>>>>> 5.10.0

#pragma once

/******************************************************************************/
/* Includes                                                                   */
/******************************************************************************/
#include <vector>
#include "irr_v3d.h"

/******************************************************************************/
/* Forward declarations                                                       */
/******************************************************************************/

class NodeDefManager;
class Map;

/******************************************************************************/
/* Typedefs and macros                                                        */
/******************************************************************************/

typedef enum {
	DIR_XP,
	DIR_XM,
	DIR_ZP,
	DIR_ZM
} PathDirections;

/** List of supported algorithms */
typedef enum {
	PA_DIJKSTRA,           /**< Dijkstra shortest path algorithm             */
	PA_PLAIN,            /**< A* algorithm using heuristics to find a path */
	PA_PLAIN_NP          /**< A* algorithm without prefetching of map data */
} PathAlgorithm;

/******************************************************************************/
/* declarations                                                               */
/******************************************************************************/

/** c wrapper function to use from scriptapi */
std::vector<v3s16> get_path(Map *map, const NodeDefManager *ndef,
		v3s16 source,
		v3s16 destination,
		unsigned int searchdistance,
		unsigned int max_jump,
		unsigned int max_drop,
		PathAlgorithm algo);
