-- Meshes

<<<<<<< HEAD
local S = minetest.get_translator("testnodes")
=======
local S = core.get_translator("testnodes")
>>>>>>> 5.10.0

local ocorner_cbox = {
	type = "fixed",
	fixed = {
		{-0.5,  -0.5,  -0.5,   0.5, -0.25, 0.5},
		{-0.5, -0.25, -0.25,  0.25,     0, 0.5},
		{-0.5,     0,     0,     0,  0.25, 0.5},
		{-0.5,  0.25,  0.25, -0.25,   0.5, 0.5}
	}
}

local tall_pyr_cbox = {
	type = "fixed",
	fixed = {
		{ -0.5,   -0.5,  -0.5,   0.5,  -0.25, 0.5 },
		{ -0.375, -0.25, -0.375, 0.375, 0,    0.375},
		{ -0.25,   0,    -0.25,  0.25,  0.25, 0.25},
		{ -0.125,  0.25, -0.125, 0.125, 0.5,  0.125}
	}
}

-- Normal mesh
<<<<<<< HEAD
minetest.register_node("testnodes:mesh", {
=======
core.register_node("testnodes:mesh", {
>>>>>>> 5.10.0
	description = S("Mesh Test Node"),
	drawtype = "mesh",
	mesh = "testnodes_pyramid.obj",
	tiles = {"testnodes_mesh_stripes2.png"},
	paramtype = "light",
	collision_box = tall_pyr_cbox,

	groups = {dig_immediate=3},
})

-- Facedir mesh: outer corner slope
<<<<<<< HEAD
minetest.register_node("testnodes:mesh_facedir", {
=======
core.register_node("testnodes:mesh_facedir", {
>>>>>>> 5.10.0
	description = S("Facedir Mesh Test Node").."\n"..
		S("param2 = facedir rotation (0..23)"),
	drawtype = "mesh",
	mesh = "testnodes_ocorner.obj",
	tiles = {"testnodes_mesh_stripes.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	collision_box = ocorner_cbox,

	groups = {dig_immediate=3},
})

<<<<<<< HEAD
minetest.register_node("testnodes:mesh_colorfacedir", {
=======
core.register_node("testnodes:mesh_colorfacedir", {
>>>>>>> 5.10.0
	description = S("Color Facedir Mesh Test Node").."\n"..
		S("param2 = color + facedir rotation (0..23, 32..55, ...)"),
	drawtype = "mesh",
	mesh = "testnodes_ocorner.obj",
	tiles = {"testnodes_mesh_stripes3.png"},
	paramtype = "light",
	paramtype2 = "colorfacedir",
	palette = "testnodes_palette_facedir.png",
	collision_box = ocorner_cbox,

	groups = {dig_immediate=3},
})

<<<<<<< HEAD
minetest.register_node("testnodes:mesh_4dir", {
=======
core.register_node("testnodes:mesh_4dir", {
>>>>>>> 5.10.0
	description = S("4dir Mesh Test Node").."\n"..
		S("param2 = 4dir rotation (0..3)"),
	drawtype = "mesh",
	mesh = "testnodes_ocorner.obj",
	tiles = {"testnodes_mesh_stripes5.png"},
	paramtype = "light",
	paramtype2 = "4dir",
	collision_box = ocorner_cbox,

	groups = {dig_immediate=3},
})

<<<<<<< HEAD
minetest.register_node("testnodes:mesh_color4dir", {
=======
core.register_node("testnodes:mesh_color4dir", {
>>>>>>> 5.10.0
	description = S("Color 4dir Mesh Test Node").."\n"..
		S("param2 = color + 4dir rotation (0..255)"),
	drawtype = "mesh",
	mesh = "testnodes_ocorner.obj",
	tiles = {"testnodes_mesh_stripes6.png"},
	paramtype = "light",
	paramtype2 = "color4dir",
	palette = "testnodes_palette_4dir.png",
	collision_box = ocorner_cbox,

	groups = {dig_immediate=3},
})

-- Wallmounted mesh: pyramid
<<<<<<< HEAD
minetest.register_node("testnodes:mesh_wallmounted", {
=======
core.register_node("testnodes:mesh_wallmounted", {
>>>>>>> 5.10.0
	description = S("Wallmounted Mesh Test Node").."\n"..
		S("param2 = wallmounted rotation (0..7)"),
	drawtype = "mesh",
	mesh = "testnodes_pyramid.obj",
	tiles = {"testnodes_mesh_stripes9.png"},
	paramtype = "light",
	paramtype2 = "wallmounted",
	collision_box = tall_pyr_cbox,

	groups = {dig_immediate=3},
})

<<<<<<< HEAD
minetest.register_node("testnodes:mesh_colorwallmounted", {
=======
core.register_node("testnodes:mesh_colorwallmounted", {
>>>>>>> 5.10.0
	description = S("Color Wallmounted Mesh Test Node").."\n"..
		S("param2 = color + wallmounted rotation (0..7, 8..15, ...)"),
	drawtype = "mesh",
	mesh = "testnodes_pyramid.obj",
	tiles = {"testnodes_mesh_stripes10.png"},
	paramtype = "light",
	paramtype2 = "colorwallmounted",
	palette = "testnodes_palette_wallmounted.png",
	collision_box = tall_pyr_cbox,

	groups = {dig_immediate=3},
})


<<<<<<< HEAD
minetest.register_node("testnodes:mesh_double", {
=======
core.register_node("testnodes:mesh_double", {
>>>>>>> 5.10.0
	description = S("Double-sized Mesh Test Node"),
	drawtype = "mesh",
	mesh = "testnodes_pyramid.obj",
	tiles = {"testnodes_mesh_stripes2.png"},
	paramtype = "light",
	collision_box = tall_pyr_cbox,
	visual_scale = 2,

	groups = {dig_immediate=3},
})
<<<<<<< HEAD
minetest.register_node("testnodes:mesh_half", {
=======
core.register_node("testnodes:mesh_half", {
>>>>>>> 5.10.0
	description = S("Half-sized Mesh Test Node"),
	drawtype = "mesh",
	mesh = "testnodes_pyramid.obj",
	tiles = {"testnodes_mesh_stripes2.png"},
	paramtype = "light",
	collision_box = tall_pyr_cbox,
	visual_scale = 0.5,

	groups = {dig_immediate=3},
})

<<<<<<< HEAD
minetest.register_node("testnodes:mesh_waving1", {
=======
core.register_node("testnodes:mesh_waving1", {
>>>>>>> 5.10.0
	description = S("Plantlike-waving Mesh Test Node").."\n"..
		S("Waves if waving plants are enabled by client"),
	drawtype = "mesh",
	mesh = "testnodes_pyramid.obj",
	tiles = {"testnodes_mesh_stripes4.png^[multiply:#B0FFB0"},
	paramtype = "light",
	collision_box = tall_pyr_cbox,
	waving = 1,

	groups = {dig_immediate=3},
})
<<<<<<< HEAD
minetest.register_node("testnodes:mesh_waving2", {
=======
core.register_node("testnodes:mesh_waving2", {
>>>>>>> 5.10.0
	description = S("Leaflike-waving Mesh Test Node").."\n"..
		S("Waves if waving leaves are enabled by client"),
	drawtype = "mesh",
	mesh = "testnodes_pyramid.obj",
	tiles = {"testnodes_mesh_stripes4.png^[multiply:#FFFFB0"},
	paramtype = "light",
	collision_box = tall_pyr_cbox,
	waving = 2,

	groups = {dig_immediate=3},
})
<<<<<<< HEAD
minetest.register_node("testnodes:mesh_waving3", {
=======
core.register_node("testnodes:mesh_waving3", {
>>>>>>> 5.10.0
	description = S("Liquidlike-waving Mesh Test Node").."\n"..
		S("Waves if waving liquids are enabled by client"),
	drawtype = "mesh",
	mesh = "testnodes_pyramid.obj",
	tiles = {"testnodes_mesh_stripes4.png^[multiply:#B0B0FF"},
	paramtype = "light",
	collision_box = tall_pyr_cbox,
	waving = 3,

	groups = {dig_immediate=3},
})
