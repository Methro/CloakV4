--
-- Mod channels experimental handlers
--
<<<<<<< HEAD
local mod_channel = minetest.mod_channel_join("experimental_preview")

minetest.register_on_modchannel_message(function(channel, sender, message)
	minetest.log("action", "[modchannels] Server received message `" .. message
=======
local mod_channel = core.mod_channel_join("experimental_preview")

core.register_on_modchannel_message(function(channel, sender, message)
	core.log("action", "[modchannels] Server received message `" .. message
>>>>>>> 5.10.0
			.. "` on channel `" .. channel .. "` from sender `" .. sender .. "`")

	if mod_channel:is_writeable() then
		mod_channel:send_all("experimental answers to preview")
		mod_channel:leave()
	end
end)
