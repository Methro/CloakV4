<<<<<<< HEAD
local path = minetest.get_modpath(minetest.get_current_modname())
=======
local path = core.get_modpath(core.get_current_modname())
>>>>>>> 5.10.0

dofile(path.."/drawtypes.lua")
dofile(path.."/meshes.lua")
dofile(path.."/nodeboxes.lua")
dofile(path.."/param2.lua")
dofile(path.."/performance_test_nodes.lua")
dofile(path.."/properties.lua")
dofile(path.."/liquids.lua")
dofile(path.."/light.lua")
dofile(path.."/textures.lua")
dofile(path.."/overlays.lua")
dofile(path.."/commands.lua")
