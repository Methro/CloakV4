local WATER_ALPHA = "^[opacity:" .. 160
local WATER_VISC = 1
local LAVA_VISC = 7

--
-- Node definitions
--

-- Register nodes

<<<<<<< HEAD
minetest.register_node("basenodes:stone", {
=======
core.register_node("basenodes:stone", {
>>>>>>> 5.10.0
	description = "Stone",
	tiles = {"default_stone.png"},
	groups = {cracky=3},
})

<<<<<<< HEAD
minetest.register_node("basenodes:desert_stone", {
=======
core.register_node("basenodes:desert_stone", {
>>>>>>> 5.10.0
	description = "Desert Stone",
	tiles = {"default_desert_stone.png"},
	groups = {cracky=3},
})

<<<<<<< HEAD
minetest.register_node("basenodes:dirt_with_grass", {
=======
core.register_node("basenodes:dirt_with_grass", {
>>>>>>> 5.10.0
	description = "Dirt with Grass",
	tiles ={"default_grass.png",
		-- a little dot on the bottom to distinguish it from dirt
		"default_dirt.png^basenodes_dirt_with_grass_bottom.png",
		{name = "default_dirt.png^default_grass_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
})

<<<<<<< HEAD
minetest.register_node("basenodes:dirt_with_snow", {
=======
core.register_node("basenodes:dirt_with_snow", {
>>>>>>> 5.10.0
	description = "Dirt with Snow",
	tiles ={"basenodes_dirt_with_snow.png",
		-- a little dot on the bottom to distinguish it from dirt
		"default_dirt.png^basenodes_dirt_with_snow_bottom.png",
		{name = "default_dirt.png^default_snow_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
})

<<<<<<< HEAD
minetest.register_node("basenodes:dirt", {
=======
core.register_node("basenodes:dirt", {
>>>>>>> 5.10.0
	description = "Dirt",
	tiles ={"default_dirt.png"},
	groups = {crumbly=3, soil=1},
})

<<<<<<< HEAD
minetest.register_node("basenodes:sand", {
=======
core.register_node("basenodes:sand", {
>>>>>>> 5.10.0
	description = "Sand",
	tiles ={"default_sand.png"},
	groups = {crumbly=3},
})

<<<<<<< HEAD
minetest.register_node("basenodes:desert_sand", {
=======
core.register_node("basenodes:desert_sand", {
>>>>>>> 5.10.0
	description = "Desert Sand",
	tiles ={"default_desert_sand.png"},
	groups = {crumbly=3},
})

<<<<<<< HEAD
minetest.register_node("basenodes:gravel", {
=======
core.register_node("basenodes:gravel", {
>>>>>>> 5.10.0
	description = "Gravel",
	tiles ={"default_gravel.png"},
	groups = {crumbly=2},
})

<<<<<<< HEAD
minetest.register_node("basenodes:junglegrass", {
=======
core.register_node("basenodes:junglegrass", {
>>>>>>> 5.10.0
	description = "Jungle Grass",
	drawtype = "plantlike",
	tiles ={"default_junglegrass.png"},
	inventory_image = "default_junglegrass.png",
	wield_image = "default_junglegrass.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=3},
})

<<<<<<< HEAD
minetest.register_node("basenodes:tree", {
=======
core.register_node("basenodes:tree", {
>>>>>>> 5.10.0
	description = "Normal Tree Trunk",
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=1},
})

<<<<<<< HEAD
minetest.register_node("basenodes:leaves", {
=======
core.register_node("basenodes:leaves", {
>>>>>>> 5.10.0
	description = "Normal Leaves",
	drawtype = "allfaces_optional",
	tiles = {"default_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy=3},
})

<<<<<<< HEAD
minetest.register_node("basenodes:jungletree", {
=======
core.register_node("basenodes:jungletree", {
>>>>>>> 5.10.0
	description = "Jungle Tree Trunk",
	tiles = {"default_jungletree_top.png", "default_jungletree_top.png", "default_jungletree.png"},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=1},
})

<<<<<<< HEAD
minetest.register_node("basenodes:jungleleaves", {
=======
core.register_node("basenodes:jungleleaves", {
>>>>>>> 5.10.0
	description = "Jungle Leaves",
	drawtype = "allfaces_optional",
	tiles = {"default_jungleleaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy=3},
})

<<<<<<< HEAD
minetest.register_node("basenodes:pine_tree", {
=======
core.register_node("basenodes:pine_tree", {
>>>>>>> 5.10.0
	description = "Pine Tree Trunk",
	tiles = {"default_pine_tree_top.png", "default_pine_tree_top.png", "default_pine_tree.png"},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=1},
})

<<<<<<< HEAD
minetest.register_node("basenodes:pine_needles", {
=======
core.register_node("basenodes:pine_needles", {
>>>>>>> 5.10.0
	description = "Pine Needles",
	drawtype = "allfaces_optional",
	tiles = {"default_pine_needles.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy=3},
})

<<<<<<< HEAD
minetest.register_node("basenodes:water_source", {
=======
core.register_node("basenodes:water_source", {
>>>>>>> 5.10.0
	description = "Water Source".."\n"..
		"Swimmable, spreading, renewable liquid".."\n"..
		"Drowning damage: 1",
	drawtype = "liquid",
	waving = 3,
	tiles = {"default_water.png"..WATER_ALPHA},
	special_tiles = {
		{name = "default_water.png"..WATER_ALPHA, backface_culling = false},
		{name = "default_water.png"..WATER_ALPHA, backface_culling = true},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "basenodes:water_flowing",
	liquid_alternative_source = "basenodes:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a = 64, r = 100, g = 100, b = 200},
	post_effect_color_shaded = true,
	groups = {water = 3, liquid = 3},
})

<<<<<<< HEAD
minetest.register_node("basenodes:water_flowing", {
=======
core.register_node("basenodes:water_flowing", {
>>>>>>> 5.10.0
	description = "Flowing Water".."\n"..
		"Swimmable, spreading, renewable liquid".."\n"..
		"Drowning damage: 1",
	drawtype = "flowingliquid",
	waving = 3,
	tiles = {"default_water_flowing.png"},
	special_tiles = {
		{name = "default_water_flowing.png"..WATER_ALPHA,
			backface_culling = false},
		{name = "default_water_flowing.png"..WATER_ALPHA,
			backface_culling = false},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "basenodes:water_flowing",
	liquid_alternative_source = "basenodes:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a = 64, r = 100, g = 100, b = 200},
	post_effect_color_shaded = true,
	groups = {water = 3, liquid = 3},
})

<<<<<<< HEAD
minetest.register_node("basenodes:river_water_source", {
=======
core.register_node("basenodes:river_water_source", {
>>>>>>> 5.10.0
	description = "River Water Source".."\n"..
		"Swimmable, spreading, non-renewable liquid".."\n"..
		"Drowning damage: 1",
	drawtype = "liquid",
	waving = 3,
	tiles = { "default_river_water.png"..WATER_ALPHA },
	special_tiles = {
		{name = "default_river_water.png"..WATER_ALPHA, backface_culling = false},
		{name = "default_river_water.png"..WATER_ALPHA, backface_culling = true},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "basenodes:river_water_flowing",
	liquid_alternative_source = "basenodes:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	post_effect_color_shaded = true,
	groups = {water = 3, liquid = 3, },
})

<<<<<<< HEAD
minetest.register_node("basenodes:river_water_flowing", {
=======
core.register_node("basenodes:river_water_flowing", {
>>>>>>> 5.10.0
	description = "Flowing River Water".."\n"..
		"Swimmable, spreading, non-renewable liquid".."\n"..
		"Drowning damage: 1",
	drawtype = "flowingliquid",
	waving = 3,
	tiles = {"default_river_water_flowing.png"..WATER_ALPHA},
	special_tiles = {
		{name = "default_river_water_flowing.png"..WATER_ALPHA,
			backface_culling = false},
		{name = "default_river_water_flowing.png"..WATER_ALPHA,
			backface_culling = false},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "basenodes:river_water_flowing",
	liquid_alternative_source = "basenodes:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	post_effect_color_shaded = true,
	groups = {water = 3, liquid = 3, },
})

<<<<<<< HEAD
minetest.register_node("basenodes:lava_flowing", {
=======
core.register_node("basenodes:lava_flowing", {
>>>>>>> 5.10.0
	description = "Flowing Lava".."\n"..
		"Swimmable, spreading, renewable liquid".."\n"..
		"4 damage per second".."\n"..
		"Drowning damage: 1",
	drawtype = "flowingliquid",
	tiles = {"default_lava_flowing.png"},
	special_tiles = {
		{name="default_lava_flowing.png", backface_culling = false},
		{name="default_lava_flowing.png", backface_culling = false},
	},
	paramtype = "light",
<<<<<<< HEAD
	light_source = minetest.LIGHT_MAX,
=======
	light_source = core.LIGHT_MAX,
>>>>>>> 5.10.0
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	damage_per_second = 4,
	liquidtype = "flowing",
	liquid_alternative_flowing = "basenodes:lava_flowing",
	liquid_alternative_source = "basenodes:lava_source",
	liquid_viscosity = LAVA_VISC,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=1},
})

<<<<<<< HEAD
minetest.register_node("basenodes:lava_source", {
=======
core.register_node("basenodes:lava_source", {
>>>>>>> 5.10.0
	description = "Lava Source".."\n"..
		"Swimmable, spreading, renewable liquid".."\n"..
		"4 damage per second".."\n"..
		"Drowning damage: 1",
	drawtype = "liquid",
	tiles = { "default_lava.png" },
	special_tiles = {
		{name = "default_lava.png", backface_culling = false},
		{name = "default_lava.png", backface_culling = true},
	},
	paramtype = "light",
<<<<<<< HEAD
	light_source = minetest.LIGHT_MAX,
=======
	light_source = core.LIGHT_MAX,
>>>>>>> 5.10.0
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	damage_per_second = 4,
	liquidtype = "source",
	liquid_alternative_flowing = "basenodes:lava_flowing",
	liquid_alternative_source = "basenodes:lava_source",
	liquid_viscosity = LAVA_VISC,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=1},
})

<<<<<<< HEAD
minetest.register_node("basenodes:cobble", {
=======
core.register_node("basenodes:cobble", {
>>>>>>> 5.10.0
	description = "Cobblestone",
	tiles ={"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky=3},
})

<<<<<<< HEAD
minetest.register_node("basenodes:mossycobble", {
=======
core.register_node("basenodes:mossycobble", {
>>>>>>> 5.10.0
	description = "Mossy Cobblestone",
	tiles ={"default_mossycobble.png"},
	is_ground_content = false,
	groups = {cracky=3},
})

<<<<<<< HEAD
minetest.register_node("basenodes:apple", {
=======
core.register_node("basenodes:apple", {
>>>>>>> 5.10.0
	description = "Apple".."\n"..
		"Punch: Eat (+2)",
	drawtype = "plantlike",
	tiles ={"default_apple.png"},
	inventory_image = "default_apple.png",
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	groups = {dig_immediate=3},

	-- Make eatable because why not?
<<<<<<< HEAD
	on_use = minetest.item_eat(2),
})

minetest.register_node("basenodes:ice", {
=======
	on_use = core.item_eat(2),
})

core.register_node("basenodes:ice", {
>>>>>>> 5.10.0
	description = "Ice",
	tiles ={"default_ice.png"},
	groups = {cracky=3},
})

-- The snow nodes intentionally have different tints to make them more
-- distinguishable
<<<<<<< HEAD
minetest.register_node("basenodes:snow", {
=======
core.register_node("basenodes:snow", {
>>>>>>> 5.10.0
	description = "Snow Sheet",
	tiles = {"basenodes_snow_sheet.png"},
	groups = {crumbly=3},
	walkable = false,
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
	},
})

<<<<<<< HEAD
minetest.register_node("basenodes:snowblock", {
=======
core.register_node("basenodes:snowblock", {
>>>>>>> 5.10.0
	description = "Snow Block",
	tiles ={"default_snow.png"},
	groups = {crumbly=3},
})


