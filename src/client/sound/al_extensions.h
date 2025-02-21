<<<<<<< HEAD
/*
Minetest
Copyright (C) 2023 DS

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
// Copyright (C) 2023 DS
>>>>>>> 5.10.0

#pragma once

#include "al_helpers.h"

namespace sound {

/**
 * Struct for AL and ALC extensions
 */
struct ALExtensions
{
	explicit ALExtensions(const ALCdevice *deviceHandle [[maybe_unused]]);

#ifdef AL_SOFT_direct_channels_remix
	bool have_ext_AL_SOFT_direct_channels_remix = false;
#endif
};

}
