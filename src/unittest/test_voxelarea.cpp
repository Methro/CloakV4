<<<<<<< HEAD
/*
Minetest
Copyright (C) 2018 nerzhul, Loic Blot <loic.blot@unix-experience.fr>

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
// Copyright (C) 2018 nerzhul, Loic Blot <loic.blot@unix-experience.fr>
>>>>>>> 5.10.0

#include "test.h"
#include "voxel.h"

class TestVoxelArea : public TestBase
{
public:
	TestVoxelArea() { TestManager::registerTestModule(this); }
	const char *getName() { return "TestVoxelArea"; }

	void runTests(IGameDef *gamedef);

	void test_addarea();
	void test_pad();
	void test_extent();
	void test_volume();
	void test_contains_voxelarea();
	void test_contains_point();
	void test_contains_i();
	void test_equal();
	void test_plus();
	void test_minor();
<<<<<<< HEAD
=======
	void test_diff();
>>>>>>> 5.10.0
	void test_intersect();
	void test_index_xyz_all_pos();
	void test_index_xyz_x_neg();
	void test_index_xyz_y_neg();
	void test_index_xyz_z_neg();
	void test_index_xyz_xy_neg();
	void test_index_xyz_xz_neg();
	void test_index_xyz_yz_neg();
	void test_index_xyz_all_neg();
	void test_index_v3s16_all_pos();
	void test_index_v3s16_x_neg();
	void test_index_v3s16_y_neg();
	void test_index_v3s16_z_neg();
	void test_index_v3s16_xy_neg();
	void test_index_v3s16_xz_neg();
	void test_index_v3s16_yz_neg();
	void test_index_v3s16_all_neg();
	void test_add_x();
	void test_add_y();
	void test_add_z();
	void test_add_p();
};

static TestVoxelArea g_test_instance;

void TestVoxelArea::runTests(IGameDef *gamedef)
{
	TEST(test_addarea);
	TEST(test_pad);
	TEST(test_extent);
	TEST(test_volume);
	TEST(test_contains_voxelarea);
	TEST(test_contains_point);
	TEST(test_contains_i);
	TEST(test_equal);
	TEST(test_plus);
	TEST(test_minor);
<<<<<<< HEAD
=======
	TEST(test_diff);
>>>>>>> 5.10.0
	TEST(test_intersect);
	TEST(test_index_xyz_all_pos);
	TEST(test_index_xyz_x_neg);
	TEST(test_index_xyz_y_neg);
	TEST(test_index_xyz_z_neg);
	TEST(test_index_xyz_xy_neg);
	TEST(test_index_xyz_xz_neg);
	TEST(test_index_xyz_yz_neg);
	TEST(test_index_xyz_all_neg);
	TEST(test_index_v3s16_all_pos);
	TEST(test_index_v3s16_x_neg);
	TEST(test_index_v3s16_y_neg);
	TEST(test_index_v3s16_z_neg);
	TEST(test_index_v3s16_xy_neg);
	TEST(test_index_v3s16_xz_neg);
	TEST(test_index_v3s16_yz_neg);
	TEST(test_index_v3s16_all_neg);
	TEST(test_add_x);
	TEST(test_add_y);
	TEST(test_add_z);
	TEST(test_add_p);
}

void TestVoxelArea::test_addarea()
{
<<<<<<< HEAD
	VoxelArea v1(v3s16(-1447, 8854, -875), v3s16(-147, -9547, 669));
	VoxelArea v2(v3s16(-887, 4445, -5478), v3s16(447, -8779, 4778));

	v1.addArea(v2);
	UASSERT(v1.MinEdge == v3s16(-1447, 4445, -5478));
	UASSERT(v1.MaxEdge == v3s16(447, -8779, 4778));
=======
	VoxelArea v1(v3s16(-1447, -9547, -875), v3s16(-147, 8854, 669));
	VoxelArea v2(v3s16(-887, -8779, -5478), v3s16(447, 4445, 4778));

	v1.addArea(v2);
	UASSERT(v1.MinEdge == v3s16(-1447, -9547, -5478));
	UASSERT(v1.MaxEdge == v3s16(447, 8854, 4778));
>>>>>>> 5.10.0
}

void TestVoxelArea::test_pad()
{
<<<<<<< HEAD
	VoxelArea v1(v3s16(-1447, 8854, -875), v3s16(-147, -9547, 669));
	v1.pad(v3s16(100, 200, 300));

	UASSERT(v1.MinEdge == v3s16(-1547, 8654, -1175));
	UASSERT(v1.MaxEdge == v3s16(-47, -9347, 969));
=======
	VoxelArea v1(v3s16(-1447, -9547, -875), v3s16(-147, 8854, 669));
	v1.pad(v3s16(100, 200, 300));

	UASSERT(v1.MinEdge == v3s16(-1547, -9747, -1175));
	UASSERT(v1.MaxEdge == v3s16(-47, 9054, 969));
>>>>>>> 5.10.0
}

void TestVoxelArea::test_extent()
{
	VoxelArea v1(v3s16(-1337, -547, -789), v3s16(-147, 447, 669));
	UASSERT(v1.getExtent() == v3s16(1191, 995, 1459));

	VoxelArea v2(v3s16(32493, -32507, 32752), v3s16(32508, -32492, 32767));
	UASSERT(v2.getExtent() == v3s16(16, 16, 16));
<<<<<<< HEAD
=======

	UASSERT(VoxelArea({2,3,4}, {1,2,3}).hasEmptyExtent());
	UASSERT(VoxelArea({2,3,4}, {2,2,3}).hasEmptyExtent() == false);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_volume()
{
	VoxelArea v1(v3s16(-1337, -547, -789), v3s16(-147, 447, 669));
	UASSERTEQ(s32, v1.getVolume(), 1728980655);

	VoxelArea v2(v3s16(32493, -32507, 32752), v3s16(32508, -32492, 32767));
	UASSERTEQ(s32, v2.getVolume(), 4096);
<<<<<<< HEAD
=======

	UASSERTEQ(s32, VoxelArea({2,3,4}, {1,2,3}).getVolume(), 0);
	UASSERTEQ(s32, VoxelArea({2,3,4}, {2,2,3}).getVolume(), 0);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_contains_voxelarea()
{
	VoxelArea v1(v3s16(-1337, -9547, -789), v3s16(-147, 750, 669));
	UASSERTEQ(bool, v1.contains(VoxelArea(v3s16(-200, 10, 10), v3s16(-150, 10, 10))),
			true);
	UASSERTEQ(bool, v1.contains(VoxelArea(v3s16(-2550, 10, 10), v3s16(10, 10, 10))),
			false);
	UASSERTEQ(bool, v1.contains(VoxelArea(v3s16(-10, 10, 10), v3s16(3500, 10, 10))),
			false);
	UASSERTEQ(bool,
			v1.contains(VoxelArea(
					v3s16(-800, -400, 669), v3s16(-500, 200, 669))),
			true);
	UASSERTEQ(bool,
			v1.contains(VoxelArea(
					v3s16(-800, -400, 670), v3s16(-500, 200, 670))),
			false);
}

void TestVoxelArea::test_contains_point()
{
	VoxelArea v1(v3s16(-1337, -9547, -789), v3s16(-147, 750, 669));
	UASSERTEQ(bool, v1.contains(v3s16(-200, 10, 10)), true);
	UASSERTEQ(bool, v1.contains(v3s16(-10000, 10, 10)), false);
	UASSERTEQ(bool, v1.contains(v3s16(-100, 10000, 10)), false);
	UASSERTEQ(bool, v1.contains(v3s16(-100, 100, 10000)), false);
	UASSERTEQ(bool, v1.contains(v3s16(-100, 100, -10000)), false);
	UASSERTEQ(bool, v1.contains(v3s16(10000, 100, 10)), false);
}

void TestVoxelArea::test_contains_i()
{
	VoxelArea v1(v3s16(-1337, -9547, -789), v3s16(-147, 750, 669));
	UASSERTEQ(bool, v1.contains(10), true);
	UASSERTEQ(bool, v1.contains(v1.getVolume()), false);
	UASSERTEQ(bool, v1.contains(v1.getVolume() - 1), true);
	UASSERTEQ(bool, v1.contains(v1.getVolume() + 1), false);
	UASSERTEQ(bool, v1.contains(-1), false)

	VoxelArea v2(v3s16(10, 10, 10), v3s16(30, 30, 30));
	UASSERTEQ(bool, v2.contains(10), true);
	UASSERTEQ(bool, v2.contains(0), true);
	UASSERTEQ(bool, v2.contains(-1), false);
}

void TestVoxelArea::test_equal()
{
	VoxelArea v1(v3s16(-1337, -9547, -789), v3s16(-147, 750, 669));
	UASSERTEQ(bool, v1 == VoxelArea(v3s16(-1337, -9547, -789), v3s16(-147, 750, 669)),
			true);
<<<<<<< HEAD
	UASSERTEQ(bool, v1 == VoxelArea(v3s16(0, 0, 0), v3s16(-147, 750, 669)), false);
	UASSERTEQ(bool, v1 == VoxelArea(v3s16(0, 0, 0), v3s16(-147, 750, 669)), false);
=======
	UASSERTEQ(bool, v1 == VoxelArea(v3s16(-147, 0, 0), v3s16(0, 750, 669)), false);
>>>>>>> 5.10.0
	UASSERTEQ(bool, v1 == VoxelArea(v3s16(0, 0, 0), v3s16(0, 0, 0)), false);
}

void TestVoxelArea::test_plus()
{
	VoxelArea v1(v3s16(-10, -10, -10), v3s16(100, 100, 100));
	UASSERT(v1 + v3s16(10, 0, 0) ==
			VoxelArea(v3s16(0, -10, -10), v3s16(110, 100, 100)));
	UASSERT(v1 + v3s16(10, -10, 0) ==
			VoxelArea(v3s16(0, -20, -10), v3s16(110, 90, 100)));
	UASSERT(v1 + v3s16(0, 0, 35) ==
			VoxelArea(v3s16(-10, -10, 25), v3s16(100, 100, 135)));
}

void TestVoxelArea::test_minor()
{
	VoxelArea v1(v3s16(-10, -10, -10), v3s16(100, 100, 100));
	UASSERT(v1 - v3s16(10, 0, 0) ==
			VoxelArea(v3s16(-20, -10, -10), v3s16(90, 100, 100)));
	UASSERT(v1 - v3s16(10, -10, 0) ==
			VoxelArea(v3s16(-20, 0, -10), v3s16(90, 110, 100)));
	UASSERT(v1 - v3s16(0, 0, 35) ==
			VoxelArea(v3s16(-10, -10, -45), v3s16(100, 100, 65)));
}

<<<<<<< HEAD
=======
void TestVoxelArea::test_diff()
{
	const VoxelArea v1({-10, -10, -10}, {100, 100, 100});
	std::vector<VoxelArea> res;

	v1.diff(VoxelArea({-10, -10, -10}, {99, 100, 100}), res);
	UASSERTEQ(auto, res.size(), 1U);
	UASSERT(res[0] == VoxelArea({100, -10, -10}, {100, 100, 100}));
	res.clear();

	v1.diff(VoxelArea({-10, -10, -10}, {100, 50, 80}), res);
	UASSERTEQ(auto, res.size(), 2U);
	UASSERT(res[0] == VoxelArea({-10, -10, 81}, {100, 100, 100}));
	UASSERT(res[1] == VoxelArea({-10, 51, -10}, {100, 100, 80}));
	res.clear();

	// edge cases
	v1.diff(v1, res);
	UASSERT(res.empty());
	v1.diff(VoxelArea(), res);
	UASSERTEQ(auto, res.size(), 1U);
	UASSERT(res[0] == v1);
}

>>>>>>> 5.10.0
void TestVoxelArea::test_intersect()
{
	VoxelArea v1({-10, -10, -10}, {10, 10, 10});
	VoxelArea v2({1, 2, 3}, {4, 5, 6});
	VoxelArea v3({11, 11, 11}, {11, 11, 11});
	VoxelArea v4({-11, -2, -10}, {10, 2, 11});
	UASSERT(v2.intersect(v1) == v2);
	UASSERT(v1.intersect(v2) == v2.intersect(v1));
	UASSERT(v1.intersect(v3).hasEmptyExtent());
	UASSERT(v3.intersect(v1) == v1.intersect(v3));
	UASSERT(v1.intersect(v4) ==
			VoxelArea({-10, -2, -10}, {10, 2, 10}));
}

void TestVoxelArea::test_index_xyz_all_pos()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(156, 25, 236), 155);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(156, 25, 236), 1267138774);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(156, 25, 236), 1310722495);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_xyz_x_neg()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(-147, 25, 366), -148);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(-147, 25, 366), -870244825);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(-147, 25, 366), -821642064);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_xyz_y_neg()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(247, -269, 100), 246);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(247, -269, 100), -989760747);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(247, -269, 100), -951958678);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_xyz_z_neg()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(244, 336, -887), 243);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(244, 336, -887), -191478876);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(244, 336, -887), -190690273);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_xyz_xy_neg()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(-365, -47, 6978), -366);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(-365, -47, 6978), 1493679101);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(-365, -47, 6978), 1797427926);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_xyz_yz_neg()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(66, -58, -789), 65);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(66, -58, -789), 1435362734);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(66, -58, -789), 1439223357);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_xyz_xz_neg()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(-36, 589, -992), -37);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(-36, 589, -992), -1934371362);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(-36, 589, -992), -1937179681);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_xyz_all_neg()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(-88, -99, -1474), -89);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(-88, -99, -1474), -1343473846);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(-88, -99, -1474), -1366133749);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_v3s16_all_pos()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(v3s16(156, 25, 236)), 155);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(v3s16(156, 25, 236)), 1267138774);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(v3s16(156, 25, 236)), 1310722495);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_v3s16_x_neg()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(v3s16(-147, 25, 366)), -148);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(v3s16(-147, 25, 366)), -870244825);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(v3s16(-147, 25, 366)), -821642064);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_v3s16_y_neg()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(v3s16(247, -269, 100)), 246);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(v3s16(247, -269, 100)), -989760747);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(v3s16(247, -269, 100)), -951958678);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_v3s16_z_neg()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(v3s16(244, 336, -887)), 243);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(v3s16(244, 336, -887)), -191478876);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(v3s16(244, 336, -887)), -190690273);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_v3s16_xy_neg()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(v3s16(-365, -47, 6978)), -366);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(v3s16(-365, -47, 6978)), 1493679101);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(v3s16(-365, -47, 6978)), 1797427926);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_v3s16_yz_neg()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(v3s16(66, -58, -789)), 65);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(v3s16(66, -58, -789)), 1435362734);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(v3s16(66, -58, -789)), 1439223357);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_v3s16_xz_neg()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(v3s16(-36, 589, -992)), -37);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(v3s16(-36, 589, -992)), -1934371362);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(v3s16(-36, 589, -992)), -1937179681);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_index_v3s16_all_neg()
{
	VoxelArea v1;
	UASSERTEQ(s32, v1.index(v3s16(-88, -99, -1474)), -89);

<<<<<<< HEAD
	VoxelArea v2(v3s16(756, 8854, -875), v3s16(-147, -9547, 669));
	UASSERTEQ(s32, v2.index(v3s16(-88, -99, -1474)), -1343473846);
=======
	VoxelArea v2(v3s16(-147, -9547, -875), v3s16(756, 8854, 669));
	UASSERTEQ(s32, v2.index(v3s16(-88, -99, -1474)), -1366133749);
>>>>>>> 5.10.0
}

void TestVoxelArea::test_add_x()
{
	v3s16 extent;
	u32 i = 4;
	VoxelArea::add_x(extent, i, 8);
	UASSERTEQ(u32, i, 12)
}

void TestVoxelArea::test_add_y()
{
	v3s16 extent(740, 16, 87);
	u32 i = 8;
	VoxelArea::add_y(extent, i, 88);
	UASSERTEQ(u32, i, 65128)
}

void TestVoxelArea::test_add_z()
{
	v3s16 extent(114, 80, 256);
	u32 i = 4;
	VoxelArea::add_z(extent, i, 8);
	UASSERTEQ(u32, i, 72964)
}

void TestVoxelArea::test_add_p()
{
	v3s16 extent(33, 14, 742);
	v3s16 a(15, 12, 369);
	u32 i = 4;
	VoxelArea::add_p(extent, i, a);
	UASSERTEQ(u32, i, 170893)
}
