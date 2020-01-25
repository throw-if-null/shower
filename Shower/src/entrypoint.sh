#!/bin/sh

main() {

    export PATH=$PATH:/opt/mssql-tools/bin
	
    echo "Work directory: $PWD"
	
	cd shower
	input="playlist"
	PLAYLIST=""
	
	while read line
	do
		buildPlaylist $PLAYLIST $line
	done < "$input"

	echo "Scripts for execution: $PLAYLIST"
	
	cd scripts
	echo "WORKDIR: $PWD"
	
    for i in $(echo $PLAYLIST | sed "s/,/ /g")
	do
		echo "Start running script: $i"
		sqlcmd -S sqlserver -U sa -P Password1! -i $i || exit 1
		echo "Finished running script: $i"
	done

	outro
	
	sleep infinity
}

buildPlaylist() {	
	if [ -z "$1" ];
	then
		PLAYLIST=$2
	else
		PLAYLIST=$1,$2
	fi;  
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