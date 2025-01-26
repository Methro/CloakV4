core.cheats = {
	["Combat"] = {
		["AntiKnockback"] = "antiknockback",
		["AttachmentFloat"] = "float_above_parent",
	},
	["Movement"] = {
		["Freecam"] = "freecam",
		["AutoForward"] = "continuous_forward",
		["PitchMove"] = "pitch_move",
		["AutoJump"] = "autojump",
		["Flight"] = "free_move",
		["Noclip"] = "noclip",
		["FastMove"] = "fast_move",
		["Jesus"] = "jesus",
		["NoSlow"] = "no_slow",
		["JetPack"] = "jetpack",
		["AntiSlip"] = "antislip",
		["AirJump"] = "airjump",
		["Spider"] = "spider",
		["AutoSneak"] = "autosneak",
		["BunnyHop"] = "BHOP",
	},
	["Render"] = {
		["Xray"] = "xray",
		["Fullbright"] = "fullbright",
		["HUDBypass"] = "hud_flags_bypass",
		["NoHurtCam"] = "no_hurt_cam",
		["Coords"] = "coords",
		["CheatHUD"] = "cheat_hud",
		["EntityESP"] = "enable_entity_esp",
		["EntityTracers"] = "enable_entity_tracers",
		["PlayerESP"] = "enable_player_esp",
--		["HealthESP"] = "enable_health_esp",
		["PlayerTracers"] = "enable_player_tracers",
		["NodeESP"] = "enable_node_esp",
		["NodeTracers"] = "enable_node_tracers",
		["TunnelESP"] = "enable_tunnel_esp",
		["TunnelTracers"] = "enable_tunnel_tracers",
		["NoRender"] = "norender.particles",
        ["NoDrownCam"] = "small_post_effect_color", 
        ["BrightNight"] = "no_night",
	},
	["Interact"] = {
		["FastDig"] = "fastdig",
		["FastPlace"] = "fastplace",
		["AutoDig"] = "autodig",
		["AutoPlace"] = "autoplace",
		["InstantBreak"] = "instant_break",
		["FastHit"] = "spamclick",
		["AutoHit"] = "autohit",
		["AutoTool"] = "autotool",
	},
	["Player"] = {
		["NoFallDamage"] = "prevent_natural_damage",
		["NoForceRotate"] = "no_force_rotate",
		["Reach"] = "reach",
		--["PointLiquids"] = "point_liquids",
		["AutoRespawn"] = "autorespawn",
		--["ThroughWalls"] = "dont_point_nodes",
        ["PrivBypass"] = "priv_bypass",
        ["QuickMenu"] = "use_old_menu",
        ["NoViewBob"] = "nobob",
	},
	["World"] = {
		["Silence"] = "silence",

	},
	["Misc"] = {
		["Nametags"] = "use_colored_nametags",
		["AntiAFK"] = "anti_afk",
		["Panic"] = "panic",
	}
}

core.infotexts = {}

function core.register_cheat(cheatname, category, func)
	core.cheats[category] = core.cheats[category] or {}
	core.cheats[category][cheatname] = func
end

function core.register_cheat_with_infotext(cheatname, category, func, infotext)
	core.infotexts[category] = core.infotexts[category] or {}
	core.infotexts[category][cheatname] = infotext
	core.register_cheat(cheatname, category, func)
end

function core.update_infotext(cheatname, category, func, infotext)
	core.infotexts[category] = core.infotexts[category] or {}
	core.infotexts[category][cheatname] = infotext
	core.update_infotexts()
end

core.cheat_settings = {}

function core.register_cheat_setting(setting_name, parent_category, parent_setting, setting_id, setting_data)
	 --settingname is the formatted setting name, e.g "Assist Mode"
	 --parent_category is the category of the parent setting, e.g "Combat", 
	 --parent_setting is the cheat this setting is for, e.g "autoaim", 
	 --setting_id is the setting string, e.g "autoaim.mode", 
	 --setting_data is the setting table, e.g 
	 --if its a bool,         {type="bool"}
	 --if its an int slider,  {type="slider_int", min=0, max=10, steps=10}
	 --if its a float slider, {type="slider_float", min=0.0, max=10.0, steps=100}
     --if its a text field,   {type="text", size=10}
	 --if its a selectionbox, {type="selectionbox", options={"lock", "assist"}}
	core.cheat_settings[parent_category] = core.cheat_settings[parent_category] or {}
	core.cheat_settings[parent_category][parent_setting] = core.cheat_settings[parent_category][parent_setting] or {}

	core.cheat_settings[parent_category][parent_setting][setting_id] = {
        name = setting_name,
        type = setting_data.type,
        min = setting_data.min,
        max = setting_data.max,
        steps = setting_data.steps,
        size = setting_data.size,
		options = setting_data.options
    }
end

--core.register_cheat_setting("Mode", "Combat", "autoaim", "autoaim.mode", {type="selectionbox", options={"Lock", "Assist"}})   i'll work on this later
core.register_cheat_setting("Type", "Render", "enable_health_esp", "enable_health_esp.type", {type="selectionbox", options={"Health Bar", "Above Head"}})
core.register_cheat_setting("Players Only", "Render", "enable_health_esp", "enable_health_esp.players_only", {type="bool"})
core.register_cheat_setting("Speed", "Movement", "fast_move", "fast_move.speed", {type="slider_float", min=1.0, max=10.0, steps=100})
core.register_cheat_setting("Speed", "Interact", "autohit", "autohit.speed", {type="slider_int", min=1, max=10, steps=10})
core.register_cheat_setting("Nodelist", "Render", "xray", "xray.nodes", {type="text", size=10})
core.register_cheat_setting("Instant", "Interact", "fastdig", "fastdig.instant", {type="bool"})
core.register_cheat_setting("Multiplier", "Movement", "step", "step.mult", {type="slider_float", min=1.0, max=3.5, steps=6})
core.register_cheat_setting("Y Offset", "Render", "cheat_hud", "cheat_hud.offset", {type="slider_int", min=0, max=200, steps=41})



-- Some heats with infotexts
core.register_cheat_with_infotext("Step", "Movement", "step", "Mult: 0")
core.register_cheat_with_infotext("HealthESP", "Render", "enable_health_esp", "")




-- Globalstep for infotexts (if u wanna)
local update_interval = 0.25
local timer = 0

minetest.register_globalstep(function(dtime)
    timer = timer + dtime

    if timer >= update_interval then
        timer = 0

        --Starts here

		--Step infotext
		local step_mult = minetest.settings:get("step.mult")
		core.update_infotext("Step", "Movement", "step", "Mult: " .. step_mult)

		--CombatLog infotext
		local combatlog_hp = minetest.settings:get("be_a_bitch.hp")
		minetest.update_infotext("CombatLog", "Combat", "be_a_bitch", "Min HP:"  .. combatlog_hp)

		--HealthESP infotext
		if core.settings:get("enable_health_esp.type") == "Health Bar" then
			core.update_infotext("HealthESP", "Render", "show_players_hp", "Health Bar")
		else
			core.update_infotext("HealthESP", "Render", "show_players_hp", "Above head")
		end

		--Ends here
    end
end)

--How did you know I like adding comments?
