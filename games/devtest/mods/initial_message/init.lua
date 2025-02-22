<<<<<<< HEAD
minetest.register_on_joinplayer(function(player)
=======
core.register_on_joinplayer(function(player)
>>>>>>> 5.10.0
	local cb = function(player)
		if not player or not player:is_player() then
			return
		end
<<<<<<< HEAD
		minetest.chat_send_player(player:get_player_name(), "This is the \"Development Test\" [devtest], meant only for testing and development.")
	end
	minetest.after(2.0, cb, player)
=======
		core.chat_send_player(player:get_player_name(), "This is the \"Development Test\" [devtest], meant only for testing and development.")
	end
	core.after(2.0, cb, player)
>>>>>>> 5.10.0
end)
