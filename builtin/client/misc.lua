function core.setting_get_pos(name)
	local value = core.settings:get(name)
	if not value then
		return nil
	end
	return core.string_to_pos(value)
end

<<<<<<< HEAD
core.EntityRelationship = {
    FRIEND = 0,
    ENEMY = 1,
	ALLY = 2,
	NEUTRAL = 3,
	STAFF = 4
};
=======
>>>>>>> 5.10.0

-- old non-method sound functions

function core.sound_stop(handle, ...)
	return handle:stop(...)
end

function core.sound_fade(handle, ...)
	return handle:fade(...)
end
