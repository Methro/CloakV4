<<<<<<< HEAD
local modname = minetest.get_current_modname()
local prefix = "["..modname.."] "

-- Startup info
minetest.log("action", prefix.."modname="..dump(modname))
minetest.log("action", prefix.."modpath="..dump(minetest.get_modpath(modname)))
minetest.log("action", prefix.."worldpath="..dump(minetest.get_worldpath()))

-- Callback info
minetest.register_on_mods_loaded(function()
	minetest.log("action", prefix.."Callback: on_mods_loaded()")
end)

minetest.register_on_chatcommand(function(name, command, params)
	minetest.log("action", prefix.."Caught command '"..command.."', issued by '"..name.."'. Parameters: '"..params.."'")
=======
local modname = core.get_current_modname()
local prefix = "["..modname.."] "

-- Startup info
core.log("action", prefix.."modname="..dump(modname))
core.log("action", prefix.."modpath="..dump(core.get_modpath(modname)))
core.log("action", prefix.."worldpath="..dump(core.get_worldpath()))

-- Callback info
core.register_on_mods_loaded(function()
	core.log("action", prefix.."Callback: on_mods_loaded()")
end)

core.register_on_chatcommand(function(name, command, params)
	core.log("action", prefix.."Caught command '"..command.."', issued by '"..name.."'. Parameters: '"..params.."'")
>>>>>>> 5.10.0
end)
