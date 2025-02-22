#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
gameid=${gameid:-devtest}
<<<<<<< HEAD
minetest=$dir/../bin/minetest
=======
executable=$dir/../bin/luanti
>>>>>>> 5.10.0
testspath=$dir/../tests
conf_server=$testspath/server.conf
worldpath=$testspath/world

run () {
	if [ -n "$PERF" ]; then
		perf record -z --call-graph dwarf -- "$@"
	else
		"$@"
	fi
}

<<<<<<< HEAD
[ -e "$minetest" ] || { echo "executable $minetest missing"; exit 1; }
=======
[ -e "$executable" ] || { echo "executable $executable missing"; exit 1; }
>>>>>>> 5.10.0

rm -rf "$worldpath"
mkdir -p "$worldpath/worldmods"

settings=(sqlite_synchronous=0 helper_mode=mapgen)
[ -n "$PROFILER" ] && settings+=(profiler_print_interval=15)
printf '%s\n' "${settings[@]}" >"$testspath/server.conf" \

ln -s "$dir/helper_mod" "$worldpath/worldmods/"

args=(--config "$conf_server" --world "$worldpath" --gameid $gameid)
[ -n "$PROFILER" ] && args+=(--verbose)
<<<<<<< HEAD
run "$minetest" --server "${args[@]}"
=======
run "$executable" --server "${args[@]}"
>>>>>>> 5.10.0
