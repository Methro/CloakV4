<<<<<<< HEAD
/*
Minetest
Copyright (C) 2013 celeron55, Perttu Ahola <celeron55@gmail.com>

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
>>>>>>> 5.10.0

/*
	Used for tuning constants when developing.

	Eg. if you have this constant somewhere that you just can't get right
	by changing it and recompiling all over again:
		v3f wield_position = v3f(55, -35, 65);

	Make it look like this:
		v3f wield_position = v3f(55, -35, 65);
		QUICKTUNE_AUTONAME(QVT_FLOAT, wield_position.X, 0, 100);
		QUICKTUNE_AUTONAME(QVT_FLOAT, wield_position.Y, -80, 20);
		QUICKTUNE_AUTONAME(QVT_FLOAT, wield_position.Z, 0, 100);

	Then you can modify the values at runtime, using the keys
		keymap_quicktune_prev
		keymap_quicktune_next
		keymap_quicktune_dec
		keymap_quicktune_inc

	Once you have modified the values at runtime and then quit, the game
	will print out all the modified values at the end:
		Modified quicktune values:
		wield_position.X = 60
		wield_position.Y = -30
		wield_position.Z = 65

	The QUICKTUNE macros shouldn't generally be left in committed code.
*/

#pragma once

#include <string>
#include <map>
#include <vector>

enum QuicktuneValueType{
	QVT_NONE,
	QVT_FLOAT
};
struct QuicktuneValue
{
	QuicktuneValueType type = QVT_NONE;
	union{
		struct{
			float current;
			float min;
			float max;
		} value_QVT_FLOAT;
	};
	bool modified = false;

	QuicktuneValue() = default;

	std::string getString();
	void relativeAdd(float amount);
};

const std::vector<std::string> &getQuicktuneNames();
QuicktuneValue getQuicktuneValue(const std::string &name);
void setQuicktuneValue(const std::string &name, const QuicktuneValue &val);

void updateQuicktuneValue(const std::string &name, QuicktuneValue &val);

#ifndef NDEBUG
	#define QUICKTUNE(type_, var, min_, max_, name){\
		QuicktuneValue qv;\
		qv.type = type_;\
		qv.value_##type_.current = var;\
		qv.value_##type_.min = min_;\
		qv.value_##type_.max = max_;\
		updateQuicktuneValue(name, qv);\
		var = qv.value_##type_.current;\
	}
#else // NDEBUG
	#define QUICKTUNE(type, var, min_, max_, name){}
#endif

#define QUICKTUNE_AUTONAME(type_, var, min_, max_)\
	QUICKTUNE(type_, var, min_, max_, #var)
