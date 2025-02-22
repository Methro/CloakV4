<<<<<<< HEAD
local F = minetest.formspec_escape
local S = minetest.get_translator("chest_of_everything")
=======
local F = core.formspec_escape
local S = core.get_translator("chest_of_everything")
>>>>>>> 5.10.0

local detached_inventories = {}

-- Per-player lists (indexed by player name)
local current_pages = {} -- current page number
local current_max_pages = {} -- current max. page number
local current_searches = {} -- current search string

local SLOTS_W = 10
local SLOTS_H = 5
local SLOTS = SLOTS_W * SLOTS_H

-- This determines how the items are sorted
-- "by_type": Sort by item type (tool/craftitem/node/"chest_of_everything" items), then alphabetically by itemstring
-- "abc": Alphabetically by itemstring
local SORT_MODE = "by_type"

local all_items_list -- cached list of all items

-- Create detached inventories
local function add_detached_inventories(player)
	local name = player:get_player_name()
<<<<<<< HEAD
	local inv_items = minetest.create_detached_inventory("chest_of_everything_items_"..name, {
=======
	local inv_items = core.create_detached_inventory("chest_of_everything_items_"..name, {
>>>>>>> 5.10.0
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			return 0
		end,
		allow_put = function(inv, listname, index, stack, player)
			return 0
		end,
		allow_take = function(inv, listname, index, stack, player)
			return -1
		end,
	}, name)
<<<<<<< HEAD
	local inv_trash = minetest.create_detached_inventory("chest_of_everything_trash_"..name, {
=======
	local inv_trash = core.create_detached_inventory("chest_of_everything_trash_"..name, {
>>>>>>> 5.10.0
		allow_take = function(inv, listname, index, stack, player)
			return 0
		end,
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			return 0
		end,
		on_put = function(inv, listname, index, stack, player)
			inv:set_list(listname, {})
		end,
	}, name)
	inv_trash:set_size("main", 1)
	detached_inventories[name] = { items = inv_items, trash = inv_trash }
end

local sort_items_by_type = function(item1, item2)
	--[[ Sort items in this order:
	* Bag of Everything
	* Chest of Everything
	* Test tools
	* Other tools
	* Craftitems
	* Other items
	* Items from the 'broken' mod
	* Dummy items ]]
<<<<<<< HEAD
	local def1 = minetest.registered_items[item1]
	local def2 = minetest.registered_items[item2]
	local tool1 = def1.type == "tool"
	local tool2 = def2.type == "tool"
	local testtool1 = minetest.get_item_group(item1, "testtool") == 1
	local testtool2 = minetest.get_item_group(item2, "testtool") == 1
	local dummy1 = minetest.get_item_group(item1, "dummy") == 1
	local dummy2 = minetest.get_item_group(item2, "dummy") == 1
=======
	local def1 = core.registered_items[item1]
	local def2 = core.registered_items[item2]
	local tool1 = def1.type == "tool"
	local tool2 = def2.type == "tool"
	local testtool1 = core.get_item_group(item1, "testtool") == 1
	local testtool2 = core.get_item_group(item2, "testtool") == 1
	local dummy1 = core.get_item_group(item1, "dummy") == 1
	local dummy2 = core.get_item_group(item2, "dummy") == 1
>>>>>>> 5.10.0
	local broken1 = def1.mod_origin == "broken"
	local broken2 = def2.mod_origin == "broken"
	local craftitem1 = def1.type == "craft"
	local craftitem2 = def2.type == "craft"
	if item1 == "chest_of_everything:bag" then
		return true
	elseif item2 == "chest_of_everything:bag" then
		return false
	elseif item1 == "chest_of_everything:chest" then
		return true
	elseif item2 == "chest_of_everything:chest" then
		return false
	elseif dummy1 and not dummy2 then
		return false
	elseif not dummy1 and dummy2 then
		return true
	elseif broken1 and not broken2 then
		return false
	elseif not broken1 and broken2 then
		return true
	elseif testtool1 and not testtool2 then
		return true
	elseif not testtool1 and testtool2 then
		return false
	elseif tool1 and not tool2 then
		return true
	elseif not tool1 and tool2 then
		return false
	elseif craftitem1 and not craftitem2 then
		return true
	elseif not craftitem1 and craftitem2 then
		return false
	else
		return item1 < item2
	end
end

local sort_items_alphabetically = function(item1, item2)
	return item1 < item2
end

local collect_items = function(filter, lang_code)
	local items = {}
	if filter then
		filter = string.trim(filter)
		filter = string.lower(filter) -- to make sure the search is case-insensitive
	end
<<<<<<< HEAD
	for itemstring, def in pairs(minetest.registered_items) do
=======
	for itemstring, def in pairs(core.registered_items) do
>>>>>>> 5.10.0
		if itemstring ~= "" and itemstring ~= "unknown" and itemstring ~= "ignore" then
			if filter and lang_code then
				local desc = ItemStack(itemstring):get_description()
				local matches
				-- First, try to match original description
				if desc ~= "" then
					local ldesc = string.lower(desc)
					matches = string.match(ldesc, filter) ~= nil
					-- Second, try to match translated description
					if not matches then
<<<<<<< HEAD
						local tdesc = minetest.get_translated_string(lang_code, desc)
=======
						local tdesc = core.get_translated_string(lang_code, desc)
>>>>>>> 5.10.0
						if tdesc ~= "" then
							tdesc = string.lower(tdesc)
							matches = string.match(tdesc, filter) ~= nil
						end
					end
					-- Third, try to match translated short description
					if not matches then
						local sdesc = ItemStack(itemstring):get_short_description()
						if sdesc ~= "" then
<<<<<<< HEAD
							sdesc = minetest.get_translated_string(lang_code, sdesc)
=======
							sdesc = core.get_translated_string(lang_code, sdesc)
>>>>>>> 5.10.0
							sdesc = string.lower(sdesc)
							matches = string.match(sdesc, filter) ~= nil
						end
					end

				end
				-- Fourth, try to match itemstring
				if not matches then
					matches = string.match(itemstring, filter) ~= nil
				end

				-- If item was matched, add to item list
				if matches then
					table.insert(items, itemstring)
				end
			else
				table.insert(items, itemstring)
			end
		end
	end
	local compare
	if SORT_MODE == "by_type" then
		compare = sort_items_by_type
	elseif SORT_MODE == "abc" then
		compare = sort_items_alphabetically
	end
	table.sort(items, compare)

	return items
end

local function update_inventory(name)
	local search = current_searches[name] or ""
	local items
	if search == "" then
		items = all_items_list
	else
<<<<<<< HEAD
		local lang_code = minetest.get_player_information(name).lang_code
=======
		local lang_code = core.get_player_information(name).lang_code
>>>>>>> 5.10.0
		items = collect_items(search, lang_code)
	end
	local max_page = math.ceil(#items / SLOTS)
	current_max_pages[name] = max_page

	local inv = detached_inventories[name].items
	inv:set_size("main", #items)
	inv:set_list("main", items)
	if not current_pages[name] then
		current_pages[name] = 1
	end
	if current_pages[name] > max_page then
		current_pages[name] = max_page
	end
	if current_pages[name] < 1 then
		current_pages[name] = 1
	end
end

local function get_formspec(page, name)
	local start = 0 + (page-1)*SLOTS
	if not name then
		return ""
	end
<<<<<<< HEAD
	local player = minetest.get_player_by_name(name)
=======
	local player = core.get_player_by_name(name)
>>>>>>> 5.10.0
	local playerinvsize = player:get_inventory():get_size("main")
	local hotbarsize = player:hud_get_hotbar_itemcount()
	local pinv_w, pinv_h, pinv_x
	pinv_w = hotbarsize
	pinv_h = math.ceil(playerinvsize / pinv_w)
	pinv_w = math.min(pinv_w, 10)
	pinv_h = math.min(pinv_w, 4)
	pinv_x = 0
	if pinv_w < 9 then
		pinv_x = 1
	end

	local pagestr = ""
	local max_page = current_max_pages[name]
	if max_page > 1 then
		pagestr = "button[0,5.45;1,1;chest_of_everything_prev;"..F(S("<")).."]"..
		"button[1,5.45;1,1;chest_of_everything_next;"..F(S(">")).."]"..
		"label[0,5.1;"..F(S("Page: @1/@2", page, max_page)).."]"
	end

	local search_text = current_searches[name] or ""

	local inventory_list
	if current_max_pages[name] > 0 then
		inventory_list = "list[detached:chest_of_everything_items_"..name..";main;0,0;"..SLOTS_W..","..SLOTS_H..";"..start.."]"
	else
		inventory_list = "label[2.5,2.5;"..F(S("No items found.")).."]"
		if search_text ~= "" then
			inventory_list = inventory_list .. "button[2.5,3.25;3,0.8;search_button_reset_big;"..F(S("Reset search")).."]"
		end
	end

	return "size[10,10.5]"..
	inventory_list ..
	"list[current_player;main;"..pinv_x..",6.75;"..pinv_w..","..pinv_h..";]" ..
	"label[9,5.1;"..F(S("Trash:")).."]" ..
	"list[detached:chest_of_everything_trash_"..name..";main;9,5.5;1,1]" ..
	"field[2.2,5.75;4,1;search;;"..F(search_text).."]" ..
	"field_enter_after_edit[search;true]" ..
	"field_close_on_enter[search;false]" ..
	"button[6,5.45;1.6,1;search_button_start;"..F(S("Search")).."]" ..
	"button[7.6,5.45;0.8,1;search_button_reset;"..F(S("X")).."]" ..
	"tooltip[search_button_reset;"..F(S("Reset search")).."]" ..
	pagestr ..
	"listring[detached:chest_of_everything_items_"..name..";main]"..
	"listring[current_player;main]"..
	"listring[detached:chest_of_everything_trash_"..name..";main]"
end

local show_formspec = function(name)
	local page = current_pages[name]
	local form = get_formspec(page, name)
<<<<<<< HEAD
	minetest.show_formspec(name, "chest_of_everything:getitem", form)
	return true
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
=======
	core.show_formspec(name, "chest_of_everything:getitem", form)
	return true
end

core.register_on_player_receive_fields(function(player, formname, fields)
>>>>>>> 5.10.0
	if formname ~= "chest_of_everything:getitem" then
		return
	end
	local name = player:get_player_name()
	local page = current_pages[name]
	local old_page = page
	-- Next page or previous page
	if fields.chest_of_everything_next or fields.chest_of_everything_prev then
		if fields.chest_of_everything_next then
			page = page + 1
		elseif fields.chest_of_everything_prev then
			page = page - 1
		end
		-- Handle page change
		if page < 1 then
			page = 1
		end
		local max_page = current_max_pages[name]
		if page > max_page then
			page = max_page
		end
		if page ~= old_page then
			current_pages[name] = page
			show_formspec(name)
		end
		return
	-- Search
	elseif (fields.search_button_start or (fields.key_enter and fields.key_enter_field == "search")) and fields.search then
		current_searches[name] = fields.search
		update_inventory(name)
		show_formspec(name, fields.search)
		return
	-- Reset search
	elseif (fields.search_button_reset or fields.search_button_reset_big) then
		current_searches[name] = ""
		update_inventory(name)
		show_formspec(name)
		return
	end
end)

<<<<<<< HEAD
minetest.register_tool("chest_of_everything:bag", {
=======
core.register_tool("chest_of_everything:bag", {
>>>>>>> 5.10.0
	description = S("Bag of Everything") .. "\n" ..
		S("Grants access to all items"),
	inventory_image = "chest_of_everything_bag.png",
	wield_image = "chest_of_everything_bag.png",
	groups = { disable_repair = 1 },
	on_use = function(itemstack, user)
		if user and user:is_player() then
			local name = user:get_player_name()
			show_formspec(name)
		end
	end,
})

<<<<<<< HEAD
minetest.register_node("chest_of_everything:chest", {
=======
core.register_node("chest_of_everything:chest", {
>>>>>>> 5.10.0
	description = S("Chest of Everything") .. "\n" ..
		S("Grants access to all items"),
	tiles ={"chest_of_everything_chest.png^[sheet:2x2:0,0", "chest_of_everything_chest.png^[sheet:2x2:0,0",
		"chest_of_everything_chest.png^[sheet:2x2:1,0", "chest_of_everything_chest.png^[sheet:2x2:1,0",
		"chest_of_everything_chest.png^[sheet:2x2:1,0", "chest_of_everything_chest.png^[sheet:2x2:0,1"},
	paramtype2 = "4dir",
	groups = { dig_immediate=2, choppy=3 },
	is_ground_content = false,
	on_construct = function(pos)
<<<<<<< HEAD
		local meta = minetest.get_meta(pos)
=======
		local meta = core.get_meta(pos)
>>>>>>> 5.10.0
		meta:set_string("infotext", S("Chest of Everything"))
	end,
	on_rightclick = function(pos, node, clicker)
		if clicker and clicker:is_player() then
			local name = clicker:get_player_name()
			show_formspec(name)
		end
	end,
})


<<<<<<< HEAD
minetest.register_on_mods_loaded(function()
	all_items_list = collect_items()
end)

minetest.register_on_joinplayer(function(player)
=======
core.register_on_mods_loaded(function()
	all_items_list = collect_items()
end)

core.register_on_joinplayer(function(player)
>>>>>>> 5.10.0
	local name = player:get_player_name()
	current_searches[name] = ""
	current_pages[name] = 1
	current_max_pages[name] = 0
	add_detached_inventories(player)
	update_inventory(name)
end)

<<<<<<< HEAD
minetest.register_on_leaveplayer(function(player)
=======
core.register_on_leaveplayer(function(player)
>>>>>>> 5.10.0
	local name = player:get_player_name()
	current_pages[name] = nil
	current_max_pages[name] = nil
	current_searches[name] = nil
end)
