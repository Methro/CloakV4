local full_description = "Description Test Item\nFor testing item decription"
<<<<<<< HEAD
minetest.register_tool("unittests:description_test", {
=======
core.register_tool("unittests:description_test", {
>>>>>>> 5.10.0
	description = full_description,
	inventory_image = "unittests_description_test.png",
	groups = { dummy = 1 },
})

<<<<<<< HEAD
minetest.register_chatcommand("item_description", {
	param = "",
	description = "Show the short and full description of the wielded item.",
	func = function(name)
		local player = minetest.get_player_by_name(name)
=======
core.register_chatcommand("item_description", {
	param = "",
	description = "Show the short and full description of the wielded item.",
	func = function(name)
		local player = core.get_player_by_name(name)
>>>>>>> 5.10.0
		local item = player:get_wielded_item()
		return true, string.format("short_description: %s\ndescription: %s",
				item:get_short_description(), item:get_description())
	end
})

local function test_short_desc()
	local function get_short_description(item)
		return ItemStack(item):get_short_description()
	end

	local stack = ItemStack("unittests:description_test")
	assert(stack:get_short_description() == "Description Test Item")
	assert(get_short_description("unittests:description_test") == "Description Test Item")
<<<<<<< HEAD
	assert(minetest.registered_items["unittests:description_test"].short_description == nil)
	assert(stack:get_description() == full_description)
	assert(stack:get_description() == minetest.registered_items["unittests:description_test"].description)
=======
	assert(core.registered_items["unittests:description_test"].short_description == nil)
	assert(stack:get_description() == full_description)
	assert(stack:get_description() == core.registered_items["unittests:description_test"].description)
>>>>>>> 5.10.0

	stack:get_meta():set_string("description", "Hello World")
	assert(stack:get_short_description() == "Hello World")
	assert(stack:get_description() == "Hello World")
	assert(get_short_description(stack) == "Hello World")
	assert(get_short_description("unittests:description_test") == "Description Test Item")

	stack:get_meta():set_string("short_description", "Foo Bar")
	assert(stack:get_short_description() == "Foo Bar")
	assert(stack:get_description() == "Hello World")

	return true
end
unittests.register("test_short_desc", test_short_desc)
