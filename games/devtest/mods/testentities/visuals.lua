-- Minimal test entities to test visuals

<<<<<<< HEAD
minetest.register_entity("testentities:sprite", {
=======
core.register_entity("testentities:sprite", {
>>>>>>> 5.10.0
	initial_properties = {
		visual = "sprite",
		textures = { "testentities_sprite.png" },
	},
})

<<<<<<< HEAD
minetest.register_entity("testentities:upright_sprite", {
=======
core.register_entity("testentities:upright_sprite", {
>>>>>>> 5.10.0
	initial_properties = {
		visual = "upright_sprite",
		textures = {
			"testentities_upright_sprite1.png",
			"testentities_upright_sprite2.png",
		},
	},
})

<<<<<<< HEAD
minetest.register_entity("testentities:cube", {
=======
core.register_entity("testentities:cube", {
>>>>>>> 5.10.0
	initial_properties = {
		visual = "cube",
		textures = {
			"testentities_cube1.png",
			"testentities_cube2.png",
			"testentities_cube3.png",
			"testentities_cube4.png",
			"testentities_cube5.png",
			"testentities_cube6.png",
		},
	},
})

<<<<<<< HEAD
minetest.register_entity("testentities:item", {
=======
core.register_entity("testentities:item", {
>>>>>>> 5.10.0
	initial_properties = {
		visual = "item",
		wield_item = "testnodes:normal",
	},
})

<<<<<<< HEAD
minetest.register_entity("testentities:wielditem", {
=======
core.register_entity("testentities:wielditem", {
>>>>>>> 5.10.0
	initial_properties = {
		visual = "wielditem",
		wield_item = "testnodes:normal",
	},
})

<<<<<<< HEAD
minetest.register_entity("testentities:mesh", {
=======
core.register_entity("testentities:mesh", {
>>>>>>> 5.10.0
	initial_properties = {
		visual = "mesh",
		mesh = "testnodes_pyramid.obj",
		textures = {
			"testnodes_mesh_stripes2.png"
		},
	},
})

<<<<<<< HEAD
minetest.register_entity("testentities:mesh_unshaded", {
=======
core.register_entity("testentities:mesh_unshaded", {
>>>>>>> 5.10.0
	initial_properties = {
		visual = "mesh",
		mesh = "testnodes_pyramid.obj",
		textures = {
			"testnodes_mesh_stripes2.png"
		},
		shaded = false,
	},
})

<<<<<<< HEAD
minetest.register_entity("testentities:sam", {
=======
core.register_entity("testentities:sam", {
>>>>>>> 5.10.0
	initial_properties = {
		visual = "mesh",
		mesh = "testentities_sam.b3d",
		textures = {
			"testentities_sam.png"
		},
	},
	on_activate = function(self)
		self.object:set_animation({x = 0, y = 219}, 30, 0, true)
	end,
})

-- Advanced visual tests

-- An entity for testing animated and yaw-modulated sprites
<<<<<<< HEAD
minetest.register_entity("testentities:yawsprite", {
=======
core.register_entity("testentities:yawsprite", {
>>>>>>> 5.10.0
	initial_properties = {
		selectionbox = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3},
		visual = "sprite",
		visual_size = {x=0.6666, y=1},
		textures = {"testentities_dungeon_master.png^[makealpha:128,0,0^[makealpha:128,128,0"},
		spritediv = {x=6, y=5},
		initial_sprite_basepos = {x=0, y=0},
	},
	on_activate = function(self, staticdata)
		self.object:set_sprite({x=0, y=0}, 3, 0.5, true)
	end,
})

-- An entity for testing animated upright sprites
<<<<<<< HEAD
minetest.register_entity("testentities:upright_animated", {
=======
core.register_entity("testentities:upright_animated", {
>>>>>>> 5.10.0
	initial_properties = {
		visual = "upright_sprite",
		textures = {"testnodes_anim.png"},
		spritediv = {x = 1, y = 4},
	},
	on_activate = function(self)
		self.object:set_sprite({x=0, y=0}, 4, 1.0, false)
	end,
})

<<<<<<< HEAD
minetest.register_entity("testentities:nametag", {
=======
core.register_entity("testentities:nametag", {
>>>>>>> 5.10.0
	initial_properties = {
		visual = "sprite",
		textures = { "testentities_sprite.png" },
	},

	on_activate = function(self, staticdata)
		if staticdata ~= "" then
<<<<<<< HEAD
			local data = minetest.deserialize(staticdata)
=======
			local data = core.deserialize(staticdata)
>>>>>>> 5.10.0
			self.color = data.color
			self.bgcolor = data.bgcolor
		else
			self.color = {
				r = math.random(0, 255),
				g = math.random(0, 255),
				b = math.random(0, 255),
			}

			if math.random(0, 10) > 5 then
				self.bgcolor = {
					r = math.random(0, 255),
					g = math.random(0, 255),
					b = math.random(0, 255),
					a = math.random(0, 255),
				}
			end
		end

		assert(self.color)
		self.object:set_properties({
			nametag = tostring(math.random(1000, 10000)),
			nametag_color = self.color,
			nametag_bgcolor = self.bgcolor,
		})
	end,

	get_staticdata = function(self)
<<<<<<< HEAD
		return minetest.serialize({ color = self.color, bgcolor = self.bgcolor })
=======
		return core.serialize({ color = self.color, bgcolor = self.bgcolor })
>>>>>>> 5.10.0
	end,
})
