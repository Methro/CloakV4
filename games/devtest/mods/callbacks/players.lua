
local message = function(msg)
<<<<<<< HEAD
	minetest.log("action", "[callbacks] "..msg)
	minetest.chat_send_all(msg)
=======
	core.log("action", "[callbacks] "..msg)
	core.chat_send_all(msg)
>>>>>>> 5.10.0
end

core.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
	if not hitter then
		message("Player "..player:get_player_name().." punched without hitter.")
	end
end)
