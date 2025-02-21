<<<<<<< HEAD
/*
Minetest
Copyright (C) 2016 sfan5 <sfan5@live.de>

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
// Copyright (C) 2016 sfan5 <sfan5@live.de>
>>>>>>> 5.10.0

#include "test.h"

#include <string>
#include "exceptions.h"
#include "client/keycode.h"

class TestKeycode : public TestBase {
public:
	TestKeycode() { TestManager::registerTestModule(this); }
	const char *getName() { return "TestKeycode"; }

	void runTests(IGameDef *gamedef);

	void testCreateFromString();
	void testCreateFromSKeyInput();
	void testCompare();
};

static TestKeycode g_test_instance;

void TestKeycode::runTests(IGameDef *gamedef)
{
	TEST(testCreateFromString);
	TEST(testCreateFromSKeyInput);
	TEST(testCompare);
}

////////////////////////////////////////////////////////////////////////////////

#define UASSERTEQ_STR(one, two) UASSERT(strcmp(one, two) == 0)

void TestKeycode::testCreateFromString()
{
	KeyPress k;

	// Character key, from char
	k = KeyPress("R");
	UASSERTEQ_STR(k.sym(), "KEY_KEY_R");
	UASSERTCMP(int, >, strlen(k.name()), 0); // should have human description

	// Character key, from identifier
	k = KeyPress("KEY_KEY_B");
	UASSERTEQ_STR(k.sym(), "KEY_KEY_B");
	UASSERTCMP(int, >, strlen(k.name()), 0);

	// Non-Character key, from identifier
	k = KeyPress("KEY_UP");
	UASSERTEQ_STR(k.sym(), "KEY_UP");
	UASSERTCMP(int, >, strlen(k.name()), 0);

	k = KeyPress("KEY_F6");
	UASSERTEQ_STR(k.sym(), "KEY_F6");
	UASSERTCMP(int, >, strlen(k.name()), 0);

	// Irrlicht-unknown key, from char
	k = KeyPress("/");
	UASSERTEQ_STR(k.sym(), "/");
	UASSERTCMP(int, >, strlen(k.name()), 0);
}

void TestKeycode::testCreateFromSKeyInput()
{
	KeyPress k;
	irr::SEvent::SKeyInput in;

	// Character key
	in.Key = irr::KEY_KEY_3;
	in.Char = L'3';
	k = KeyPress(in);
	UASSERTEQ_STR(k.sym(), "KEY_KEY_3");

	// Non-Character key
	in.Key = irr::KEY_RSHIFT;
	in.Char = L'\0';
	k = KeyPress(in);
	UASSERTEQ_STR(k.sym(), "KEY_RSHIFT");

	// Irrlicht-unknown key
	in.Key = irr::KEY_KEY_CODES_COUNT;
	in.Char = L'?';
	k = KeyPress(in);
	UASSERTEQ_STR(k.sym(), "?");

	// prefer_character mode
	in.Key = irr::KEY_COMMA;
	in.Char = L'G';
	k = KeyPress(in, true);
	UASSERTEQ_STR(k.sym(), "KEY_KEY_G");
}

void TestKeycode::testCompare()
{
	// Basic comparison
	UASSERT(KeyPress("5") == KeyPress("KEY_KEY_5"));
	UASSERT(!(KeyPress("5") == KeyPress("KEY_NUMPAD5")));

	// Matching char suffices
	// note: This is a real-world example, Irrlicht maps XK_equal to irr::KEY_PLUS on Linux
	irr::SEvent::SKeyInput in;
	in.Key = irr::KEY_PLUS;
	in.Char = L'=';
	UASSERT(KeyPress("=") == KeyPress(in));

	// Matching keycode suffices
	irr::SEvent::SKeyInput in2;
	in.Key = in2.Key = irr::KEY_OEM_CLEAR;
	in.Char = L'\0';
	in2.Char = L';';
	UASSERT(KeyPress(in) == KeyPress(in2));
}
