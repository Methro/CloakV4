<<<<<<< HEAD
-- Register stuff with empty definitions to test if Minetest fallback options
=======
-- Register stuff with empty definitions to test if Luanti fallback options
>>>>>>> 5.10.0
-- for these things work properly.

-- The itemstrings are deliberately kept descriptive to keep them easy to
-- recognize.

<<<<<<< HEAD
minetest.register_node("broken:node_with_empty_definition", {})
minetest.register_tool("broken:tool_with_empty_definition", {})
minetest.register_craftitem("broken:craftitem_with_empty_definition", {})

minetest.register_entity("broken:entity_with_empty_definition", {})
=======
core.register_node("broken:node_with_empty_definition", {})
core.register_tool("broken:tool_with_empty_definition", {})
core.register_craftitem("broken:craftitem_with_empty_definition", {})

core.register_entity("broken:entity_with_empty_definition", {})
>>>>>>> 5.10.0
