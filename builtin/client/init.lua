<<<<<<< HEAD
-- Minetest: builtin/client/init.lua
local scriptpath = core.get_builtin_path()
local clientpath = scriptpath.."client"..DIR_DELIM
local commonpath = scriptpath.."common"..DIR_DELIM
local cheatspath = scriptpath.."cheats"..DIR_DELIM
=======
local scriptpath = core.get_builtin_path()
local clientpath = scriptpath.."client"..DIR_DELIM
local commonpath = scriptpath.."common"..DIR_DELIM
>>>>>>> 5.10.0

dofile(clientpath .. "register.lua")
dofile(commonpath .. "after.lua")
dofile(commonpath .. "mod_storage.lua")
dofile(commonpath .. "chatcommands.lua")
dofile(commonpath .. "information_formspecs.lua")
dofile(clientpath .. "chatcommands.lua")
<<<<<<< HEAD
dofile(clientpath .. "death_formspec.lua")
dofile(clientpath .. "misc.lua")
dofile(clientpath .. "util.lua")
dofile(clientpath .. "cheats.lua")
dofile(clientpath .. "wasplib.lua")

dofile(cheatspath .. "combat.lua")
dofile(cheatspath .. "autoteam.lua")
dofile(cheatspath .. "crystalspam.lua")
dofile(cheatspath .. "inventory.lua")
dofile(cheatspath .. "physics_override.lua")
dofile(cheatspath .. "worldutil.lua")
dofile(cheatspath .. "autototem.lua")
dofile(cheatspath .. "combatlog.lua")
dofile(cheatspath .. "autostaff.lua")
dofile(cheatspath .. "misc.lua")
=======
dofile(clientpath .. "misc.lua")
>>>>>>> 5.10.0
assert(loadfile(commonpath .. "item_s.lua"))({}) -- Just for push/read node functions
