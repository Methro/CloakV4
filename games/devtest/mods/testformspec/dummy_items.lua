-- This code adds dummy items that are supposed to be used in formspecs
-- for testing item_image formspec elements.

<<<<<<< HEAD
minetest.register_node("testformspec:node", {
=======
core.register_node("testformspec:node", {
>>>>>>> 5.10.0
	description = "Formspec Test Node",
	tiles = { "testformspec_node.png" },
	groups = { dig_immediate = 3, dummy = 1 },
})

<<<<<<< HEAD
minetest.register_craftitem("testformspec:item", {
=======
core.register_craftitem("testformspec:item", {
>>>>>>> 5.10.0
	description = "Formspec Test Item",
	inventory_image = "testformspec_item.png",
	groups = { dummy = 1 },
})
