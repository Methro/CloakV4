<<<<<<< HEAD
--Minetest
=======
--Luanti
>>>>>>> 5.10.0
--Copyright (C) 2018-20 rubenwardy
--
--This program is free software; you can redistribute it and/or modify
--it under the terms of the GNU Lesser General Public License as published by
--the Free Software Foundation; either version 2.1 of the License, or
--(at your option) any later version.
--
--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--GNU Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public License along
--with this program; if not, write to the Free Software Foundation, Inc.,
--51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

if not core.get_http_api then
	function create_contentdb_dlg()
		return messagebox("contentdb",
<<<<<<< HEAD
				fgettext("ContentDB is not available when Minetest was compiled without cURL"))
=======
				fgettext("ContentDB is not available when Luanti was compiled without cURL"))
>>>>>>> 5.10.0
	end
	return
end

-- Filter
local search_string = ""
local cur_page = 1
<<<<<<< HEAD
local num_per_page = 5
local filter_type = 1
local filter_types_titles = {
	fgettext("All packages"),
	fgettext("Games"),
	fgettext("Mods"),
	fgettext("Texture packs"),
}
=======
local filter_type
>>>>>>> 5.10.0

-- Automatic package installation
local auto_install_spec = nil

<<<<<<< HEAD
local filter_types_type = {
	nil,
	"game",
	"mod",
	"txp",
}


local function install_or_update_package(this, package)
	local install_parent
	if package.type == "mod" then
		install_parent = core.get_modpath()
	elseif package.type == "game" then
		install_parent = core.get_gamepath()
	elseif package.type == "txp" then
		install_parent = core.get_texturepath()
	else
		error("Unknown package type: " .. package.type)
	end

	if package.queued or package.downloading then
		return
	end

	local function on_confirm()
		local dlg = create_install_dialog(package)
		dlg:set_parent(this)
		this:hide()
		dlg:show()

		dlg:load_deps()
	end

	if package.type == "mod" and #pkgmgr.games == 0 then
		local dlg = messagebox("install_game",
			fgettext("You need to install a game before you can install a mod"))
		dlg:set_parent(this)
		this:hide()
		dlg:show()
	elseif not package.path and core.is_dir(install_parent .. DIR_DELIM .. package.name) then
		local dlg = create_confirm_overwrite(package, on_confirm)
		dlg:set_parent(this)
		this:hide()
		dlg:show()
	else
		on_confirm()
	end
end
=======

local filter_type_names = {
	{ "type_all", nil },
	{ "type_game", "game" },
	{ "type_mod", "mod" },
	{ "type_txp", "txp" },
}
>>>>>>> 5.10.0


-- Resolves the package specification stored in auto_install_spec into an actual package.
-- May only be called after the package list has been loaded successfully.
local function resolve_auto_install_spec()
	assert(contentdb.load_ok)

	if not auto_install_spec then
		return nil
	end

	local spec = contentdb.aliases[auto_install_spec] or auto_install_spec
	local resolved = nil

	for _, pkg in ipairs(contentdb.packages_full_unordered) do
		if pkg.id == spec then
			resolved = pkg
			break
		end
	end

	if not resolved then
		gamedata.errormessage = fgettext_ne("The package $1 was not found.", auto_install_spec)
		ui.update()

		auto_install_spec = nil
	end

	return resolved
end


-- Installs the package specified by auto_install_spec.
-- Only does something if:
-- a. The package list has been loaded successfully.
-- b. The ContentDB dialog is currently visible.
local function do_auto_install()
	if not contentdb.load_ok then
		return
	end

	local pkg = resolve_auto_install_spec()
	if not pkg then
		return
	end

	local contentdb_dlg = ui.find_by_name("contentdb")
	if not contentdb_dlg or contentdb_dlg.hidden then
		return
	end

	install_or_update_package(contentdb_dlg, pkg)
	auto_install_spec = nil
end


local function sort_and_filter_pkgs()
	contentdb.update_paths()
	contentdb.sort_packages()
<<<<<<< HEAD
	contentdb.filter_packages(search_string, filter_types_type[filter_type])
=======
	contentdb.filter_packages(search_string, filter_type)
>>>>>>> 5.10.0

	local auto_install_pkg = resolve_auto_install_spec()
	if auto_install_pkg then
		local idx = table.indexof(contentdb.packages, auto_install_pkg)
		if idx ~= -1 then
			table.remove(contentdb.packages, idx)
			table.insert(contentdb.packages, 1, auto_install_pkg)
		end
	end
end


local function load()
	if contentdb.load_ok then
		sort_and_filter_pkgs()
		return
	end
	if contentdb.loading then
		return
	end
	contentdb.fetch_pkgs(function(result)
		if result then
			sort_and_filter_pkgs()
			do_auto_install()
		end
		ui.update()
	end)
end


<<<<<<< HEAD
local function get_info_formspec(text)
	local H = 9.5
	return table.concat({
		"formspec_version[6]",
		"size[15.75,9.5]",
		core.settings:get_bool("enable_touch") and "padding[0.01,0.01]" or "position[0.5,0.55]",

		"label[4,4.35;", text, "]",
		"container[0,", H - 0.8 - 0.375, "]",
		"button[0.375,0;3,0.8;back;", fgettext("Back"), "]",
=======
local function get_info_formspec(size, padding, text)
	return table.concat({
		"formspec_version[6]",
		"size[", size.x, ",", size.y, "]",
		"padding[0,0]",
		"bgcolor[;true]",

		"label[", padding.x + 3.625, ",4.35;", text, "]",
		"container[", padding.x, ",", size.y - 0.8 - padding.y, "]",
		"button[0,0;2,0.8;back;", fgettext("Back"), "]",
>>>>>>> 5.10.0
		"container_end[]",
	})
end


<<<<<<< HEAD
local function get_formspec(dlgdata)
	if contentdb.loading then
		return get_info_formspec(fgettext("Loading..."))
	end
	if contentdb.load_error then
		return get_info_formspec(fgettext("No packages could be retrieved"))
=======
-- Determines how to fit `num_per_page` into `size` space
local function fit_cells(num_per_page, size)
	local cell_spacing = 0.5
	local columns = 1
	local cell_w, cell_h
	-- Fit cells into the available height
	while true do
		cell_w = (size.x - (columns-1)*cell_spacing) / columns
		cell_h = cell_w / 4

		local required_height = math.ceil(num_per_page / columns) * (cell_h + cell_spacing) - cell_spacing
		-- Add 0.1 to be more lenient
		if required_height <= size.y + 0.1 then
			break
		end

		columns = columns + 1
	end

	return cell_spacing, columns, cell_w, cell_h
end


local function calculate_num_per_page()
	local size = contentdb.get_formspec_size()
	local padding = contentdb.get_formspec_padding()
	local window = core.get_window_info()

	size.x = size.x - padding.x * 2
	size.y = size.y - padding.y * 2 - 1.425 - 0.25 - 0.8

	local coordToPx = window.size.x / window.max_formspec_size.x / window.real_gui_scaling

	local num_per_page = 12
	while num_per_page > 2 do
		local _, _, cell_w, _ = fit_cells(num_per_page, size)
		if cell_w * coordToPx > 350 then
			break
		end

		num_per_page = num_per_page - 1
	end
	return num_per_page
end


local function get_formspec(dlgdata)
	local window_padding = contentdb.get_formspec_padding()
	local size = contentdb.get_formspec_size()

	if contentdb.loading then
		return get_info_formspec(size, window_padding, fgettext("Loading..."))
	end
	if contentdb.load_error then
		return get_info_formspec(size, window_padding, fgettext("No packages could be retrieved"))
>>>>>>> 5.10.0
	end
	assert(contentdb.load_ok)

	contentdb.update_paths()

<<<<<<< HEAD
=======
	local num_per_page = dlgdata.num_per_page
>>>>>>> 5.10.0
	dlgdata.pagemax = math.max(math.ceil(#contentdb.packages / num_per_page), 1)
	if cur_page > dlgdata.pagemax then
		cur_page = 1
	end

<<<<<<< HEAD
	local W = 15.75
	local H = 9.5
	local formspec = {
		"formspec_version[6]",
		"size[15.75,9.5]",
		core.settings:get_bool("enable_touch") and "padding[0.01,0.01]" or "position[0.5,0.55]",

		"style[status,downloading,queued;border=false]",

		"container[0.375,0.375]",
		"field[0,0;7.225,0.8;search_string;;", core.formspec_escape(search_string), "]",
		"field_enter_after_edit[search_string;true]",
		"image_button[7.3,0;0.8,0.8;", core.formspec_escape(defaulttexturedir .. "search.png"), ";search;]",
		"image_button[8.125,0;0.8,0.8;", core.formspec_escape(defaulttexturedir .. "clear.png"), ";clear;]",
		"dropdown[9.175,0;2.7875,0.8;type;", table.concat(filter_types_titles, ","), ";", filter_type, "]",
		"container_end[]",

		-- Page nav buttons
		"container[0,", H - 0.8 - 0.375, "]",
		"button[0.375,0;3,0.8;back;", fgettext("Back"), "]",

		"container[", W - 0.375 - 0.8*4 - 2,  ",0]",
		"image_button[0,0;0.8,0.8;", core.formspec_escape(defaulttexturedir), "start_icon.png;pstart;]",
		"image_button[0.8,0;0.8,0.8;", core.formspec_escape(defaulttexturedir), "prev_icon.png;pback;]",
		"style[pagenum;border=false]",
		"button[1.6,0;2,0.8;pagenum;", tonumber(cur_page), " / ", tonumber(dlgdata.pagemax), "]",
		"image_button[3.6,0;0.8,0.8;", core.formspec_escape(defaulttexturedir), "next_icon.png;pnext;]",
		"image_button[4.4,0;0.8,0.8;", core.formspec_escape(defaulttexturedir), "end_icon.png;pend;]",
		"container_end[]",

		"container_end[]",
	}

	if contentdb.number_downloading > 0 then
		formspec[#formspec + 1] = "button[12.5875,0.375;2.7875,0.8;downloading;"
=======
	local W = size.x - window_padding.x * 2
	local H = size.y - window_padding.y * 2

	local category_x = 0
	local number_category_buttons = 4
	local max_button_w = (W - 0.375 - 0.25 - 7) / number_category_buttons
	local category_button_w = math.min(max_button_w, 3)
	local function make_category_button(name, label, selected)
		category_x = category_x + 1
		local color = selected and mt_color_green or ""
		return ("style[%s;bgcolor=%s]button[%f,0;%f,0.8;%s;%s]"):format(name, color,
				(category_x - 1) * category_button_w, category_button_w, name, label)
	end


	local selected_type = filter_type

	local search_box_width = W - 0.375 - 0.25 - 2*0.8
			- number_category_buttons * category_button_w
	local formspec = {
		"formspec_version[7]",
		"size[", size.x, ",", size.y, "]",
		"padding[0,0]",
		"bgcolor[;true]",

		"container[", window_padding.x, ",", window_padding.y, "]",

		-- Top-left: categories
		make_category_button("type_all", fgettext("All"), selected_type == nil),
		make_category_button("type_game", fgettext("Games"), selected_type == "game"),
		make_category_button("type_mod", fgettext("Mods"), selected_type == "mod"),
		make_category_button("type_txp", fgettext("Texture Packs"), selected_type == "txp"),

		-- Top-right: Search
		"container[", W - search_box_width - 0.8*2, ",0]",
		"field[0,0;", search_box_width, ",0.8;search_string;;", core.formspec_escape(search_string), "]",
		"field_enter_after_edit[search_string;true]",
		"image_button[", search_box_width, ",0;0.8,0.8;",
			core.formspec_escape(defaulttexturedir .. "search.png"), ";search;]",
		"image_button[", search_box_width + 0.8, ",0;0.8,0.8;",
			core.formspec_escape(defaulttexturedir .. "clear.png"), ";clear;]",
		"container_end[]",

		-- Bottom strip start
		"container[0,", H - 0.8, "]",
		"button[0,0;2,0.8;back;", fgettext("Back"), "]",

		-- Bottom-center: Page nav buttons
		"container[", (W - 1*4 - 2) / 2, ",0]",
		"image_button[0,0;1,0.8;", core.formspec_escape(defaulttexturedir), "start_icon.png;pstart;]",
		"image_button[1,0;1,0.8;", core.formspec_escape(defaulttexturedir), "prev_icon.png;pback;]",
		"style[pagenum;border=false]",
		"button[2,0;2,0.8;pagenum;", tonumber(cur_page), " / ", tonumber(dlgdata.pagemax), "]",
		"image_button[4,0;1,0.8;", core.formspec_escape(defaulttexturedir), "next_icon.png;pnext;]",
		"image_button[5,0;1,0.8;", core.formspec_escape(defaulttexturedir), "end_icon.png;pend;]",
		"container_end[]", -- page nav end

		-- Bottom-right: updating
		"container[", W - 3, ",0]",
		"style[status,downloading,queued;border=false]",
	}

	if contentdb.number_downloading > 0 then
		formspec[#formspec + 1] = "button[0,0;3,0.8;downloading;"
>>>>>>> 5.10.0
		if #contentdb.download_queue > 0 then
			formspec[#formspec + 1] = fgettext("$1 downloading,\n$2 queued",
					contentdb.number_downloading, #contentdb.download_queue)
		else
			formspec[#formspec + 1] = fgettext("$1 downloading...", contentdb.number_downloading)
		end
		formspec[#formspec + 1] = "]"
	else
		local num_avail_updates = 0
		for i=1, #contentdb.packages_full do
			local package = contentdb.packages_full[i]
			if package.path and package.installed_release < package.release and
					not (package.downloading or package.queued) then
				num_avail_updates = num_avail_updates + 1
			end
		end

		if num_avail_updates == 0 then
<<<<<<< HEAD
			formspec[#formspec + 1] = "button[12.5875,0.375;2.7875,0.8;status;"
			formspec[#formspec + 1] = fgettext("No updates")
			formspec[#formspec + 1] = "]"
		else
			formspec[#formspec + 1] = "button[12.5875,0.375;2.7875,0.8;update_all;"
=======
			formspec[#formspec + 1] = "button[0,0;3,0.8;status;"
			formspec[#formspec + 1] = fgettext("No updates")
			formspec[#formspec + 1] = "]"
		else
			formspec[#formspec + 1] = "button[0,0;3,0.8;update_all;"
>>>>>>> 5.10.0
			formspec[#formspec + 1] = fgettext("Update All [$1]", num_avail_updates)
			formspec[#formspec + 1] = "]"
		end
	end

<<<<<<< HEAD
=======
	formspec[#formspec + 1] = "container_end[]" -- updating end
	formspec[#formspec + 1] = "container_end[]" -- bottom strip end

>>>>>>> 5.10.0
	if #contentdb.packages == 0 then
		formspec[#formspec + 1] = "label[4,4.75;"
		formspec[#formspec + 1] = fgettext("No results")
		formspec[#formspec + 1] = "]"
	end

	-- download/queued tooltips always have the same message
	local tooltip_colors = ";#dff6f5;#302c2e]"
	formspec[#formspec + 1] = "tooltip[downloading;" .. fgettext("Downloading...") .. tooltip_colors
	formspec[#formspec + 1] = "tooltip[queued;" .. fgettext("Queued") .. tooltip_colors

<<<<<<< HEAD
	local start_idx = (cur_page - 1) * num_per_page + 1
	for i=start_idx, math.min(#contentdb.packages, start_idx+num_per_page-1) do
		local package = contentdb.packages[i]
		local container_y = (i - start_idx) * 1.375 + (2*0.375 + 0.8)
		formspec[#formspec + 1] = "container[0.375,"
		formspec[#formspec + 1] = container_y
		formspec[#formspec + 1] = "]"

		-- image
		formspec[#formspec + 1] = "image[0,0;1.5,1;"
		formspec[#formspec + 1] = core.formspec_escape(get_screenshot(package))
		formspec[#formspec + 1] = "]"

		-- title
		formspec[#formspec + 1] = "label[1.875,0.1;"
		formspec[#formspec + 1] = core.formspec_escape(
				core.colorize(mt_color_green, package.title) ..
				core.colorize("#BFBFBF", " by " .. package.author))
		formspec[#formspec + 1] = "]"

		-- buttons
		local description_width = W - 2.625 - 2 * 0.7 - 2 * 0.15

		local second_base = "image_button[-1.55,0;0.7,0.7;" .. core.formspec_escape(defaulttexturedir)
		local third_base = "image_button[-2.4,0;0.7,0.7;" .. core.formspec_escape(defaulttexturedir)
		formspec[#formspec + 1] = "container["
		formspec[#formspec + 1] = W - 0.375*2
		formspec[#formspec + 1] = ",0.1]"

		if package.downloading then
			formspec[#formspec + 1] = "animated_image[-1.7,-0.15;1,1;downloading;"
			formspec[#formspec + 1] = core.formspec_escape(defaulttexturedir)
			formspec[#formspec + 1] = "cdb_downloading.png;3;400;]"
		elseif package.queued then
			formspec[#formspec + 1] = second_base
			formspec[#formspec + 1] = "cdb_queued.png;queued;]"
		elseif not package.path then
			local elem_name = "install_" .. i .. ";"
			formspec[#formspec + 1] = "style[" .. elem_name .. "bgcolor=#71aa34]"
			formspec[#formspec + 1] = second_base .. "cdb_add.png;" .. elem_name .. "]"
			formspec[#formspec + 1] = "tooltip[" .. elem_name .. fgettext("Install") .. tooltip_colors
		else
			if package.installed_release < package.release then
				-- The install_ action also handles updating
				local elem_name = "install_" .. i .. ";"
				formspec[#formspec + 1] = "style[" .. elem_name .. "bgcolor=#28ccdf]"
				formspec[#formspec + 1] = third_base .. "cdb_update.png;" .. elem_name .. "]"
				formspec[#formspec + 1] = "tooltip[" .. elem_name .. fgettext("Update") .. tooltip_colors

				description_width = description_width - 0.7 - 0.15
			end

			local elem_name = "uninstall_" .. i .. ";"
			formspec[#formspec + 1] = "style[" .. elem_name .. "bgcolor=#a93b3b]"
			formspec[#formspec + 1] = second_base .. "cdb_clear.png;" .. elem_name .. "]"
			formspec[#formspec + 1] = "tooltip[" .. elem_name .. fgettext("Uninstall") .. tooltip_colors
		end

		local web_elem_name = "view_" .. i .. ";"
		formspec[#formspec + 1] = "image_button[-0.7,0;0.7,0.7;" ..
			core.formspec_escape(defaulttexturedir) .. "cdb_viewonline.png;" .. web_elem_name .. "]"
		formspec[#formspec + 1] = "tooltip[" .. web_elem_name ..
			fgettext("View more information in a web browser") .. tooltip_colors
		formspec[#formspec + 1] = "container_end[]"

		-- description
		formspec[#formspec + 1] = "textarea[1.855,0.3;"
		formspec[#formspec + 1] = tostring(description_width)
		formspec[#formspec + 1] = ",0.8;;;"
		formspec[#formspec + 1] = core.formspec_escape(package.short_description)
		formspec[#formspec + 1] = "]"

		formspec[#formspec + 1] = "container_end[]"
	end

=======
	formspec[#formspec + 1] = "container[0,1.425]"

	local cell_spacing, columns, cell_w, cell_h = fit_cells(num_per_page, {
		x = W,
		y = H - 1.425 - 0.25 - 0.8
	})
	local img_w = cell_h * 3 / 2

	local start_idx = (cur_page - 1) * num_per_page + 1
	for i=start_idx, math.min(#contentdb.packages, start_idx+num_per_page-1) do
		local package = contentdb.packages[i]

		table.insert_all(formspec, {
			"container[",
			(cell_w + cell_spacing) * ((i - start_idx) % columns),
			",",
			(cell_h + cell_spacing) * math.floor((i - start_idx) / columns),
			"]",

			"box[0,0;", cell_w, ",", cell_h, ";#ffffff11]",

			-- image,
			"image[0,0;", img_w, ",", cell_h, ";",
				core.formspec_escape(get_screenshot(package, package.thumbnail, 2)), "]",

			"label[", img_w + 0.25 + 0.05, ",0.5;",
				core.formspec_escape(
					core.colorize(mt_color_green, package.title) ..
							core.colorize("#BFBFBF", " by " .. package.author)), "]",

			"textarea[", img_w + 0.25, ",0.75;", cell_w - img_w - 0.25, ",", cell_h - 0.75, ";;;",
				core.formspec_escape(package.short_description), "]",

			"style[view_", i, ";border=false]",
			"style[view_", i, ":hovered;bgimg=", core.formspec_escape(defaulttexturedir .. "button_hover_semitrans.png"), "]",
			"style[view_", i, ":pressed;bgimg=", core.formspec_escape(defaulttexturedir .. "button_press_semitrans.png"), "]",
			"button[0,0;", cell_w, ",", cell_h, ";view_", i, ";]",
		})

		if package.featured then
			table.insert_all(formspec, {
				"tooltip[0,0;0.8,0.8;", fgettext("Featured"), "]",
				"image[0.2,0.2;0.4,0.4;", core.formspec_escape(defaulttexturedir .. "server_favorite.png"), "]",
			})
		end

		table.insert_all(formspec, {
			"container[", cell_w - 0.625,",", 0.25, "]",
		})

		if package.downloading then
			table.insert_all(formspec, {
				"animated_image[0,0;0.5,0.5;downloading;", core.formspec_escape(defaulttexturedir .. "cdb_downloading.png"),
					";3;400;;]",
			})
		elseif package.queued then
			table.insert_all(formspec, {
				"image[0,0;0.5,0.5;", core.formspec_escape(defaulttexturedir .. "cdb_queued.png"), "]",
			})
		elseif package.path then
			if package.installed_release < package.release then
				table.insert_all(formspec, {
					"image[0,0;0.5,0.5;", core.formspec_escape(defaulttexturedir .. "cdb_update.png"), "]",
				})
			else
				table.insert_all(formspec, {
					"image[0.1,0.1;0.3,0.3;", core.formspec_escape(defaulttexturedir .. "checkbox_64.png"), "]",
				})
			end
		end

		table.insert_all(formspec, {
			"container_end[]",
			"container_end[]",
		})
	end

	formspec[#formspec + 1] = "container_end[]"
	formspec[#formspec + 1] = "container_end[]"

>>>>>>> 5.10.0
	return table.concat(formspec)
end


local function handle_submit(this, fields)
	if fields.search or fields.key_enter_field == "search_string" then
		search_string = fields.search_string:trim()
		cur_page = 1
<<<<<<< HEAD
		contentdb.filter_packages(search_string, filter_types_type[filter_type])
=======
		contentdb.filter_packages(search_string, filter_type)
>>>>>>> 5.10.0
		return true
	end

	if fields.clear then
		search_string = ""
		cur_page = 1
<<<<<<< HEAD
		contentdb.filter_packages("", filter_types_type[filter_type])
=======
		contentdb.filter_packages("", filter_type)
>>>>>>> 5.10.0
		return true
	end

	if fields.back then
		this:delete()
		return true
	end

	if fields.pstart then
		cur_page = 1
		return true
	end

	if fields.pend then
		cur_page = this.data.pagemax
		return true
	end

	if fields.pnext then
		cur_page = cur_page + 1
		if cur_page > this.data.pagemax then
			cur_page = 1
		end
		return true
	end

	if fields.pback then
		if cur_page == 1 then
			cur_page = this.data.pagemax
		else
			cur_page = cur_page - 1
		end
		return true
	end

<<<<<<< HEAD
	if fields.type then
		local new_type = table.indexof(filter_types_titles, fields.type)
		if new_type ~= filter_type then
			filter_type = new_type
			cur_page = 1
			contentdb.filter_packages(search_string, filter_types_type[filter_type])
=======
	for _, pair in ipairs(filter_type_names) do
		if fields[pair[1]] then
			filter_type = pair[2]
			cur_page = 1
			contentdb.filter_packages(search_string, filter_type)
>>>>>>> 5.10.0
			return true
		end
	end

	if fields.update_all then
		for i=1, #contentdb.packages_full do
			local package = contentdb.packages_full[i]
			if package.path and package.installed_release < package.release and
					not (package.downloading or package.queued) then
				contentdb.queue_download(package, contentdb.REASON_UPDATE)
			end
		end
		return true
	end

<<<<<<< HEAD
=======
	local num_per_page = this.data.num_per_page
>>>>>>> 5.10.0
	local start_idx = (cur_page - 1) * num_per_page + 1
	assert(start_idx ~= nil)
	for i=start_idx, math.min(#contentdb.packages, start_idx+num_per_page-1) do
		local package = contentdb.packages[i]
		assert(package)

<<<<<<< HEAD
		if fields["install_" .. i] then
			install_or_update_package(this, package)
			return true
		end

		if fields["uninstall_" .. i] then
			local dlg = create_delete_content_dlg(package)
=======
		if fields["view_" .. i] or fields["title_" .. i] or fields["author_" .. i] then
			local dlg = create_package_dialog(package)
>>>>>>> 5.10.0
			dlg:set_parent(this)
			this:hide()
			dlg:show()
			return true
		end
<<<<<<< HEAD

		if fields["view_" .. i] then
			local url = ("%s/packages/%s?protocol_version=%d"):format(
					core.settings:get("contentdb_url"), package.url_part,
					core.get_max_supp_proto())
			core.open_url(url)
			return true
		end
=======
>>>>>>> 5.10.0
	end

	return false
end


local function handle_events(event)
	if event == "DialogShow" then
<<<<<<< HEAD
		-- On touchscreen, don't show the "MINETEST" header behind the dialog.
		mm_game_theme.set_engine(core.settings:get_bool("enable_touch"))
=======
		-- Don't show the header image behind the dialog.
		mm_game_theme.set_engine(true)
>>>>>>> 5.10.0

		-- If ContentDB is already loaded, auto-install packages here.
		do_auto_install()

		return true
	end

<<<<<<< HEAD
=======
	if event == "WindowInfoChange" then
		ui.update()
		return true
	end

>>>>>>> 5.10.0
	return false
end


--- Creates a ContentDB dialog.
---
--- @param type string | nil
--- Sets initial package filter. "game", "mod", "txp" or nil (no filter).
--- @param install_spec table | nil
--- ContentDB ID of package as returned by pkgmgr.get_contentdb_id().
--- Sets package to install or update automatically.
function create_contentdb_dlg(type, install_spec)
	search_string = ""
	cur_page = 1
<<<<<<< HEAD
	if type then
		-- table.indexof does not work on tables that contain `nil`
		for i, v in pairs(filter_types_type) do
			if v == type then
				filter_type = i
				break
			end
		end
	else
		filter_type = 1
	end
=======
	filter_type = type
>>>>>>> 5.10.0

	-- Keep the old auto_install_spec if the caller doesn't specify one.
	if install_spec then
		auto_install_spec = install_spec
	end

	load()

<<<<<<< HEAD
	return dialog_create("contentdb",
			get_formspec,
			handle_submit,
			handle_events)
=======
	local dlg = dialog_create("contentdb",
			get_formspec,
			handle_submit,
			handle_events)
	dlg.data.num_per_page = calculate_num_per_page()
	return dlg
>>>>>>> 5.10.0
end
