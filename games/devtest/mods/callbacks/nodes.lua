local function print_to_everything(msg)
<<<<<<< HEAD
	minetest.log("action", "[callbacks] " .. msg)
	minetest.chat_send_all(msg)
end

minetest.register_node("callbacks:callback_node", {
=======
	core.log("action", "[callbacks] " .. msg)
	core.chat_send_all(msg)
end

core.register_node("callbacks:callback_node", {
>>>>>>> 5.10.0
	description = "Callback Test Node (construct/destruct/timer)".."\n"..
		"Tests callbacks: on_construct, after_place_node, on_destruct, after_destruct, after_dig_node, on_timer",
	tiles = {"callbacks_callback_node.png"},
	groups = {callback_test=1, dig_immediate=3},
<<<<<<< HEAD
	-- This was known to cause a bug in minetest.item_place_node() when used
	-- via minetest.place_node(), causing a placer with no position
=======
	-- This was known to cause a bug in core.item_place_node() when used
	-- via core.place_node(), causing a placer with no position
>>>>>>> 5.10.0
	paramtype2 = "facedir",
	drop = "",

	on_construct = function(pos)
<<<<<<< HEAD
		print_to_everything("callbacks:callback_node:on_construct("..minetest.pos_to_string(pos)..")")
		local meta = minetest.get_meta(pos)
		meta:set_string("mine", "test")
		local timer = minetest.get_node_timer(pos)
=======
		print_to_everything("callbacks:callback_node:on_construct("..core.pos_to_string(pos)..")")
		local meta = core.get_meta(pos)
		meta:set_string("mine", "test")
		local timer = core.get_node_timer(pos)
>>>>>>> 5.10.0
		timer:start(4, 3)
	end,

	after_place_node = function(pos, placer)
<<<<<<< HEAD
		print_to_everything("callbacks:callback_node:after_place_node("..minetest.pos_to_string(pos)..")")
		local meta = minetest.get_meta(pos)
=======
		print_to_everything("callbacks:callback_node:after_place_node("..core.pos_to_string(pos)..")")
		local meta = core.get_meta(pos)
>>>>>>> 5.10.0
		if meta:get_string("mine") == "test" then
			print_to_everything("correct metadata found")
		else
			print_to_everything("incorrect metadata found")
		end
	end,

	on_destruct = function(pos)
<<<<<<< HEAD
		print_to_everything("callbacks:callback_node:on_destruct("..minetest.pos_to_string(pos)..")")
	end,

	after_destruct = function(pos)
		print_to_everything("callbacks:callback_node:after_destruct("..minetest.pos_to_string(pos)..")")
	end,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		print_to_everything("callbacks:callback_node:after_dig_node("..minetest.pos_to_string(pos)..")")
=======
		print_to_everything("callbacks:callback_node:on_destruct("..core.pos_to_string(pos)..")")
	end,

	after_destruct = function(pos)
		print_to_everything("callbacks:callback_node:after_destruct("..core.pos_to_string(pos)..")")
	end,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		print_to_everything("callbacks:callback_node:after_dig_node("..core.pos_to_string(pos)..")")
>>>>>>> 5.10.0
	end,

	on_timer = function(pos, elapsed)
		print_to_everything("callbacks:callback_node:on_timer(): elapsed="..dump(elapsed))
		return true
	end,
})

