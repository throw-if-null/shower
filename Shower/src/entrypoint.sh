#!/bin/sh

main() {
	echo "Starting... \n"
    echo "Work directory: $PWD"
	
	input="shower/playlist"
	
	echo "Playlist content:"
	while read line
	do
		echo "\t $line"
	done < "$input"

	outro
	
	sleep infinity
}

outro() {
	echo "\t\t" '   .--./""---.._             '
	echo "\t\t" '  /`.-.|      //\\           '
	echo "\t\t" '   /   \     /::|| `--.      '
	echo "\t\t" '        `.  ||::// ` `--.    '
	echo "\t\t" '          `.\\://  `-. `-.   '
	echo "\t\t" '            '--' `. `.       '
	echo "\t\t" '                '.   .  '-.  '
}

main