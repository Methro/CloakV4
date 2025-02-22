-- Safeguard against too much optimization. This way the results cannot be optimized
-- away, but they can be garbage collected (due to __mode = "k").
_G._bench_content_ids_data = setmetatable({}, {__mode = "k"})

local function bench_name2content()
	local t = {}
	_G._bench_content_ids_data[t] = true

<<<<<<< HEAD
	local get_content_id = minetest.get_content_id

	local start = minetest.get_us_time()

	for i = 1, 200 do
		for name in pairs(minetest.registered_nodes) do
=======
	local get_content_id = core.get_content_id

	local start = core.get_us_time()

	for i = 1, 200 do
		for name in pairs(core.registered_nodes) do
>>>>>>> 5.10.0
			t[#t + 1] = get_content_id(name)
		end
	end

<<<<<<< HEAD
	local finish = minetest.get_us_time()
=======
	local finish = core.get_us_time()
>>>>>>> 5.10.0

	return (finish - start) / 1000
end

local function bench_content2name()
	local t = {}
	_G._bench_content_ids_data[t] = true

	-- Try to estimate the highest content ID that's used
	-- (not accurate but good enough for this test)
	local n = 0
<<<<<<< HEAD
	for _ in pairs(minetest.registered_nodes) do
		n = n + 1
	end

	local get_name_from_content_id = minetest.get_name_from_content_id

	local start = minetest.get_us_time()
=======
	for _ in pairs(core.registered_nodes) do
		n = n + 1
	end

	local get_name_from_content_id = core.get_name_from_content_id

	local start = core.get_us_time()
>>>>>>> 5.10.0

	for i = 1, 200 do
		for j = 0, n do
			t[#t + 1] = get_name_from_content_id(j)
		end
	end

<<<<<<< HEAD
	local finish = minetest.get_us_time()
=======
	local finish = core.get_us_time()
>>>>>>> 5.10.0

	return (finish - start) / 1000
end

<<<<<<< HEAD
minetest.register_chatcommand("bench_name2content", {
	params = "",
	description = "Benchmark: Conversion from node names to content IDs",
	func = function(name, param)
		minetest.chat_send_player(name, "Benchmarking minetest.get_content_id. Warming up ...")
		bench_name2content()
		minetest.chat_send_player(name, "Warming up finished, now benchmarking ...")
=======
core.register_chatcommand("bench_name2content", {
	params = "",
	description = "Benchmark: Conversion from node names to content IDs",
	func = function(name, param)
		core.chat_send_player(name, "Benchmarking core.get_content_id. Warming up ...")
		bench_name2content()
		core.chat_send_player(name, "Warming up finished, now benchmarking ...")
>>>>>>> 5.10.0
		local time = bench_name2content()
		return true, ("Time: %.2f ms"):format(time)
	end,
})

<<<<<<< HEAD
minetest.register_chatcommand("bench_content2name", {
	params = "",
	description = "Benchmark: Conversion from content IDs to node names",
	func = function(name, param)
		minetest.chat_send_player(name, "Benchmarking minetest.get_name_from_content_id. Warming up ...")
		bench_content2name()
		minetest.chat_send_player(name, "Warming up finished, now benchmarking ...")
=======
core.register_chatcommand("bench_content2name", {
	params = "",
	description = "Benchmark: Conversion from content IDs to node names",
	func = function(name, param)
		core.chat_send_player(name, "Benchmarking core.get_name_from_content_id. Warming up ...")
		bench_content2name()
		core.chat_send_player(name, "Warming up finished, now benchmarking ...")
>>>>>>> 5.10.0
		local time = bench_content2name()
		return true, ("Time: %.2f ms"):format(time)
	end,
})

local function get_positions_cube(ppos)
	local pos_list = {}

	local i = 1
	for x=2,100 do
		for y=2,100 do
			for z=2,100 do
				pos_list[i] = ppos:offset(x, y, z)
				i = i + 1
			end
		end
	end

	return pos_list
end

<<<<<<< HEAD
minetest.register_chatcommand("bench_bulk_set_node", {
	params = "",
	description = "Benchmark: Bulk-set 99×99×99 stone nodes",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
=======
core.register_chatcommand("bench_bulk_set_node", {
	params = "",
	description = "Benchmark: Bulk-set 99×99×99 stone nodes",
	func = function(name, param)
		local player = core.get_player_by_name(name)
>>>>>>> 5.10.0
		if not player then
			return false, "No player."
		end
		local pos_list = get_positions_cube(player:get_pos())

<<<<<<< HEAD
		minetest.chat_send_player(name, "Benchmarking minetest.bulk_set_node. Warming up ...")

		-- warm up with stone to prevent having different callbacks
		-- due to different node topology
		minetest.bulk_set_node(pos_list, {name = "mapgen_stone"})

		minetest.chat_send_player(name, "Warming up finished, now benchmarking ...")

		local start_time = minetest.get_us_time()
		for i=1,#pos_list do
			minetest.set_node(pos_list[i], {name = "mapgen_stone"})
		end
		local middle_time = minetest.get_us_time()
		minetest.bulk_set_node(pos_list, {name = "mapgen_stone"})
		local end_time = minetest.get_us_time()
		local msg = string.format("Benchmark results: minetest.set_node loop: %.2f ms; minetest.bulk_set_node: %.2f ms",
=======
		core.chat_send_player(name, "Benchmarking core.bulk_set_node. Warming up ...")

		-- warm up with stone to prevent having different callbacks
		-- due to different node topology
		core.bulk_set_node(pos_list, {name = "mapgen_stone"})

		core.chat_send_player(name, "Warming up finished, now benchmarking ...")

		local start_time = core.get_us_time()
		for i=1,#pos_list do
			core.set_node(pos_list[i], {name = "mapgen_stone"})
		end
		local middle_time = core.get_us_time()
		core.bulk_set_node(pos_list, {name = "mapgen_stone"})
		local end_time = core.get_us_time()
		local msg = string.format("Benchmark results: core.set_node loop: %.2f ms; core.bulk_set_node: %.2f ms",
>>>>>>> 5.10.0
			((middle_time - start_time)) / 1000,
			((end_time - middle_time)) / 1000
		)
		return true, msg
	end,
})

<<<<<<< HEAD
minetest.register_chatcommand("bench_bulk_get_node", {
	params = "",
	description = "Benchmark: Bulk-get 99×99×99 nodes",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
=======
core.register_chatcommand("bench_bulk_get_node", {
	params = "",
	description = "Benchmark: Bulk-get 99×99×99 nodes",
	func = function(name, param)
		local player = core.get_player_by_name(name)
>>>>>>> 5.10.0
		if not player then
			return false, "No player."
		end
		local pos_list = get_positions_cube(player:get_pos())
		local function bench()
<<<<<<< HEAD
			local start_time = minetest.get_us_time()
			for i=1,#pos_list do
				local n = minetest.get_node(pos_list[i])
=======
			local start_time = core.get_us_time()
			for i=1,#pos_list do
				local n = core.get_node(pos_list[i])
>>>>>>> 5.10.0
				-- Make sure the name lookup is never optimized away.
				-- Table allocation might still be omitted. But only accessing
				-- the name of a node is a common pattern anyways.
				if n.name == "benchmarks:nonexistent_node" then
					error("should never happen")
				end
			end
<<<<<<< HEAD
			return minetest.get_us_time() - start_time
		end

		minetest.chat_send_player(name, "Benchmarking minetest.get_node. Warming up ...")
		bench()

		minetest.chat_send_player(name, "Warming up finished, now benchmarking ...")
		local result_us = bench()

		local msg = string.format("Benchmark results: minetest.get_node loop 1: %.2f ms",
=======
			return core.get_us_time() - start_time
		end

		core.chat_send_player(name, "Benchmarking core.get_node. Warming up ...")
		bench()

		core.chat_send_player(name, "Warming up finished, now benchmarking ...")
		local result_us = bench()

		local msg = string.format("Benchmark results: core.get_node loop 1: %.2f ms",
>>>>>>> 5.10.0
				result_us / 1000)
		return true, msg
	end,
})
<<<<<<< HEAD
=======

core.register_chatcommand("bench_bulk_swap_node", {
	params = "",
	description = "Benchmark: Bulk-swap 99×99×99 stone nodes",
	func = function(name, param)
		local player = core.get_player_by_name(name)
		if not player then
			return false, "No player."
		end
		local pos_list = get_positions_cube(player:get_pos())

		core.chat_send_player(name, "Benchmarking core.bulk_swap_node. Warming up ...")

		-- warm up because first execution otherwise becomes
		-- significantly slower
		core.bulk_swap_node(pos_list, {name = "mapgen_stone"})

		core.chat_send_player(name, "Warming up finished, now benchmarking ...")

		local start_time = core.get_us_time()
		for i=1,#pos_list do
			core.swap_node(pos_list[i], {name = "mapgen_stone"})
		end
		local middle_time = core.get_us_time()
		core.bulk_swap_node(pos_list, {name = "mapgen_stone"})
		local end_time = core.get_us_time()
		local msg = string.format("Benchmark results: core.swap_node loop: %.2f ms; core.bulk_swap_node: %.2f ms",
			((middle_time - start_time)) / 1000,
			((end_time - middle_time)) / 1000
		)
		return true, msg
	end,
})
>>>>>>> 5.10.0
