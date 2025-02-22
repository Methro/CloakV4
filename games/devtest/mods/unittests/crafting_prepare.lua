-- Registering some dummy items and recipes for the crafting tests

<<<<<<< HEAD
minetest.register_craftitem("unittests:torch", {
=======
core.register_craftitem("unittests:torch", {
>>>>>>> 5.10.0
	description = "Crafting Test Item: Torch",
	inventory_image = "unittests_torch.png",

	groups = { dummy = 1 },
})
<<<<<<< HEAD
minetest.register_craftitem("unittests:coal_lump", {
=======
core.register_craftitem("unittests:coal_lump", {
>>>>>>> 5.10.0
	description = "Crafting Test Item: Coal Lump",
	inventory_image = "unittests_coal_lump.png",

	groups = { dummy = 1 },
})
<<<<<<< HEAD
minetest.register_craftitem("unittests:stick", {
=======
core.register_craftitem("unittests:stick", {
>>>>>>> 5.10.0
	description = "Crafting Test Item: Stick",
	inventory_image = "unittests_stick.png",

	groups = { dummy = 1 },
})
<<<<<<< HEAD
minetest.register_craftitem("unittests:iron_lump", {
=======
core.register_craftitem("unittests:iron_lump", {
>>>>>>> 5.10.0
	description = "Crafting Test Item: Iron Lump",
	inventory_image = "unittests_iron_lump.png",

	groups = { dummy = 1 },
})
<<<<<<< HEAD
minetest.register_craftitem("unittests:steel_ingot", {
=======
core.register_craftitem("unittests:steel_ingot", {
>>>>>>> 5.10.0
	description = "Crafting Test Item: Steel Ingot",
	inventory_image = "unittests_steel_ingot.png",

	groups = { dummy = 1 },
})

-- Use aliases in recipes for more complete testing

<<<<<<< HEAD
minetest.register_alias("unittests:steel_ingot_alias", "unittests:steel_ingot")
minetest.register_alias("unittests:coal_lump_alias", "unittests:coal_lump")
minetest.register_alias("unittests:iron_lump_alias", "unittests:iron_lump")

-- Recipes for tests: Normal crafting, cooking and fuel

minetest.register_craft({
=======
core.register_alias("unittests:steel_ingot_alias", "unittests:steel_ingot")
core.register_alias("unittests:coal_lump_alias", "unittests:coal_lump")
core.register_alias("unittests:iron_lump_alias", "unittests:iron_lump")

-- Recipes for tests: Normal crafting, cooking and fuel

core.register_craft({
>>>>>>> 5.10.0
	output = 'unittests:torch 4',
	recipe = {
		{'unittests:coal_lump_alias'},
		{'unittests:stick'},
	}
})

<<<<<<< HEAD
minetest.register_craft({
=======
core.register_craft({
>>>>>>> 5.10.0
	type = "cooking",
	output = "unittests:steel_ingot_alias",
	recipe = "unittests:iron_lump_alias",
})

<<<<<<< HEAD
minetest.register_craft({
=======
core.register_craft({
>>>>>>> 5.10.0
	type = "fuel",
	recipe = "unittests:coal_lump_alias",
	burntime = 40,
})

-- Test tool repair
<<<<<<< HEAD
minetest.register_craft({
=======
core.register_craft({
>>>>>>> 5.10.0
	type = "toolrepair",
	additional_wear = -0.05,
})

-- Test the disable_repair=1 group
<<<<<<< HEAD
minetest.register_tool("unittests:unrepairable_tool", {
=======
core.register_tool("unittests:unrepairable_tool", {
>>>>>>> 5.10.0
	description = "Crafting Test Item: Unrepairable Tool",
	inventory_image = "unittests_unrepairable_tool.png",
	tool_capabilities = {
		groupcaps = {
			cracky = {
				times = {3, 2, 1},
			}
		}
	},
	groups = { disable_repair = 1, dummy = 1 }
})

<<<<<<< HEAD
minetest.register_tool("unittests:repairable_tool", {
=======
core.register_tool("unittests:repairable_tool", {
>>>>>>> 5.10.0
	description = "Crafting Test Item: Repairable Tool",
	inventory_image = "unittests_repairable_tool.png",
	tool_capabilities = {
		groupcaps = {
			cracky = {
				times = {3, 2, 1},
			}
		}
	},

	groups = { dummy = 1 },
})
