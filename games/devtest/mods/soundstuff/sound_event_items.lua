local simple_nodes = {
	footstep = { "Footstep Sound Node", "soundstuff_node_footstep.png", "Plays sound when you step on it" },
	dig = { "Dig Sound Node", "soundstuff_node_dig.png", "Plays sound when you dig it" },
	dug = { "Dug Sound Node", "soundstuff_node_dug.png", "Plays sound when you've dug it" },
	place = { "Place Sound Node", "soundstuff_node_place.png", "Plays sound when you place it" },
	place_failed = { "Place Failed Sound Node", "soundstuff_node_place_failed.png", "Plays sound when you try to place it but failed" },
}

for k,v in pairs(simple_nodes) do
<<<<<<< HEAD
	minetest.register_node("soundstuff:"..k, {
=======
	core.register_node("soundstuff:"..k, {
>>>>>>> 5.10.0
		description = v[1].."\n"..v[3],
		tiles = {"soundstuff_node_sound.png","soundstuff_node_sound.png",v[2]},
		groups = {dig_immediate=2},
		sounds = {
			[k] = { name = "soundstuff_mono", gain = 1.0 },
		}
	})
end

<<<<<<< HEAD
minetest.register_node("soundstuff:place_failed_attached", {
=======
core.register_node("soundstuff:place_failed_attached", {
>>>>>>> 5.10.0
	description = "Attached Place Failed Sound Node".."\n"..
		"Attached to the floor; plays a sound when you try to place it but failed",
	tiles = {"soundstuff_node_sound.png", "soundstuff_node_sound.png", "soundstuff_node_place_failed.png"},
	groups = {dig_immediate=2, attached_node=1},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = { type = "fixed", fixed = {
		{ -7/16, -7/16, -7/16, 7/16, 7/16, 7/16 },
		{ -0.5, -0.5, -0.5, 0.5, -7/16, 0.5 },
	}},
	sounds = {
		place_failed = { name = "soundstuff_mono", gain = 1.0 },
	},
})

<<<<<<< HEAD
minetest.register_node("soundstuff:fall", {
=======
core.register_node("soundstuff:fall", {
>>>>>>> 5.10.0
	description = "Fall Sound Node".."\n"..
		"Falls and plays sound if node below is gone",
	tiles = {"soundstuff_node_sound.png", "soundstuff_node_sound.png", "soundstuff_node_fall.png"},
	groups = {dig_immediate=2, falling_node=1},
	sounds = {
		fall = { name = "soundstuff_mono", gain = 1.0 },
	}
})

<<<<<<< HEAD
minetest.register_node("soundstuff:fall_attached", {
=======
core.register_node("soundstuff:fall_attached", {
>>>>>>> 5.10.0
	description = "Attached Fall Sound Node".."\n"..
		"Drops as item and plays sound if node below is gone",
	tiles = {"soundstuff_node_sound.png", "soundstuff_node_sound.png", "soundstuff_node_fall.png"},
	groups = {dig_immediate=2, attached_node=1},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = { type = "fixed", fixed = {
		{ -7/16, -7/16, -7/16, 7/16, 7/16, 7/16 },
		{ -0.5, -0.5, -0.5, 0.5, -7/16, 0.5 },
	}},
	sounds = {
		fall = { name = "soundstuff_mono", gain = 1.0 },
	}
})

<<<<<<< HEAD
minetest.register_node("soundstuff:footstep_liquid", {
=======
core.register_node("soundstuff:footstep_liquid", {
>>>>>>> 5.10.0
	description = "Liquid Footstep Sound Node".."\n"..
		"Plays sound when moving inside it; swimmable",
	drawtype = "liquid",
	tiles = {
		"soundstuff_node_sound.png^[colorize:#0000FF:127^[opacity:190",
	},
	special_tiles = {
		{name = "soundstuff_node_sound.png^[colorize:#0000FF:127^[opacity:190",
			backface_culling = false},
		{name = "soundstuff_node_sound.png^[colorize:#0000FF:127^[opacity:190",
			backface_culling = true},
	},
	liquids_pointable = true,
	liquidtype = "source",
	liquid_alternative_flowing = "soundstuff:footstep_liquid",
	liquid_alternative_source = "soundstuff:footstep_liquid",
	liquid_renewable = false,
	liquid_range = 0,
	liquid_viscosity = 0,
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	post_effect_color = {a = 64, r = 0, g = 0, b = 200},
	sounds = {
		footstep = { name = "soundstuff_mono", gain = 1.0 },
	}
})

<<<<<<< HEAD
minetest.register_node("soundstuff:footstep_climbable", {
=======
core.register_node("soundstuff:footstep_climbable", {
>>>>>>> 5.10.0
	description = "Climbable Footstep Sound Node".."\n"..
		"Plays sound when moving inside it; can climb up and down here",
	drawtype = "allfaces",
	tiles = {
		"soundstuff_node_climbable.png",
	},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	groups = { dig_immediate = 2 },
	sounds = {
		footstep = { name = "soundstuff_mono", gain = 1.0 },
	}
})



<<<<<<< HEAD
minetest.register_craftitem("soundstuff:eat", {
	description = "Eat Sound Item".."\n"..
		"Makes a sound when 'eaten' (with punch key)",
	inventory_image = "soundstuff_eat.png",
	on_use = minetest.item_eat(0),
=======
core.register_craftitem("soundstuff:eat", {
	description = "Eat Sound Item".."\n"..
		"Makes a sound when 'eaten' (with punch key)",
	inventory_image = "soundstuff_eat.png",
	on_use = core.item_eat(0),
>>>>>>> 5.10.0
	sound = {
		eat = { name = "soundstuff_mono", gain = 1.0 },
	}
})

<<<<<<< HEAD
minetest.register_tool("soundstuff:breaks", {
=======
core.register_tool("soundstuff:breaks", {
>>>>>>> 5.10.0
	description = "Break Sound Tool".."\n"..
		"Digs cracky=3 and more".."\n"..
		"Makes a sound when it breaks",
	inventory_image = "soundstuff_node_dug.png",
	sound = {
		breaks = { name = "soundstuff_mono", gain = 1.0 },
	},
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[2]=2.00, [3]=1.20}, uses=1, maxlevel=0},
			choppy={times={[2]=2.00, [3]=1.20}, uses=1, maxlevel=0},
			snappy={times={[2]=2.00, [3]=1.20}, uses=1, maxlevel=0},
			crumbly={times={[2]=2.00, [3]=1.20}, uses=1, maxlevel=0},
		},
	},
})


<<<<<<< HEAD
minetest.register_tool("soundstuff:punch_use", {
=======
core.register_tool("soundstuff:punch_use", {
>>>>>>> 5.10.0
	description = "Punch Use Sound Tool\n"..
		"Digs cracky=3 and more\n"..
		"Makes a sound when used on node or entity",
	inventory_image = "soundstuff_node_dig.png",
	sound = {
		punch_use = { name = "soundstuff_mono", gain = 1.0 },
	},
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[2]=2.00, [3]=1.20}, uses=0, maxlevel=0},
			choppy={times={[2]=2.00, [3]=1.20}, uses=0, maxlevel=0},
			snappy={times={[2]=2.00, [3]=1.20}, uses=0, maxlevel=0},
			crumbly={times={[2]=2.00, [3]=1.20}, uses=0, maxlevel=0},
		},
	},
})

<<<<<<< HEAD
minetest.register_tool("soundstuff:punch_use_air", {
=======
core.register_tool("soundstuff:punch_use_air", {
>>>>>>> 5.10.0
	description = "Punch Use (Air) Sound Tool\n"..
		"Makes a sound when used pointing at nothing",
	inventory_image = "soundstuff_node_dig.png",
	sound = {
		punch_use_air = { name = "soundstuff_mono", gain = 1.0 },
	},
})

-- Plays sound repeatedly
<<<<<<< HEAD
minetest.register_node("soundstuff:positional", {
	description = "Positional Sound Node".."\n"..
		"Repeatedly plays a sound at the node location",
	on_construct = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(0)
	end,
	on_timer = function(pos, elapsed)
		local node = minetest.get_node(pos)
=======
core.register_node("soundstuff:positional", {
	description = "Positional Sound Node".."\n"..
		"Repeatedly plays a sound at the node location",
	on_construct = function(pos)
		local timer = core.get_node_timer(pos)
		timer:start(0)
	end,
	on_timer = function(pos, elapsed)
		local node = core.get_node(pos)
>>>>>>> 5.10.0
		local dist = node.param2
		if dist == 0 then
			dist = nil
		end
<<<<<<< HEAD
		minetest.sound_play("soundstuff_mono", { pos = pos, max_hear_distance = dist })
		local timer = minetest.get_node_timer(pos)
=======
		core.sound_play("soundstuff_mono", { pos = pos, max_hear_distance = dist })
		local timer = core.get_node_timer(pos)
>>>>>>> 5.10.0
		timer:start(0.7)
	end,
	on_rightclick = function(pos, node, clicker)
		node.param2 = (node.param2 + 1) % 64
<<<<<<< HEAD
		minetest.set_node(pos, node)
=======
		core.set_node(pos, node)
>>>>>>> 5.10.0
		if clicker and clicker:is_player() then
			local dist = node.param2
			local diststr
			if dist == 0 then
				diststr = "<default>"
			else
				diststr = tostring(dist)
			end
<<<<<<< HEAD
			minetest.chat_send_player(clicker:get_player_name(), "max_hear_distance = " .. diststr)
=======
			core.chat_send_player(clicker:get_player_name(), "max_hear_distance = " .. diststr)
>>>>>>> 5.10.0
		end
	end,

	groups = { dig_immediate = 2 },
	tiles = { "soundstuff_node_sound.png" },
})

