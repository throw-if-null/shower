#!/bin/sh

main() {

	validateInptus $SERVER_INSTANCE
	validateInptus $USER_ID
	validateInptus $PASSWORD

	export PATH=$PATH:/opt/mssql-tools/bin

	echo "Work directory: $PWD"

	wiatForServerToBecomeHealthy

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
		sqlcmd -S $SERVER_INSTANCE -U $USER_ID -P $PASSWORD -i $i || exit 1
		echo "Finished running script: $i"
	done

	outro
}

validateInptus() {
	if [ -z "$1" ];
	then
		echo "$1 variable is not set"
		exit 1
	fi;
}

wiatForServerToBecomeHealthy() {

	HEALTHY=0;
	COUNTER=0;

	echo "HEALTHY: $HEALTHY and COUNTER: $COUNTER";

	while [ $HEALTHY = 0 ] && [ $COUNTER -lt 5 ]
	do

		if [ $COUNTER -gt 0 ];
		then
			sleep 5
		fi;

		COUNTER=$(($COUNTER + 1));
		HEALTHY=1;

		echo "Starting health check. Try number: $COUNTER"
		sqlcmd -S $SERVER_INSTANCE -U $USER_ID -P $PASSWORD -Q "SELECT 1" || HEALTHY=0
		echo "Finished health check. Server: $SERVER_INSTANCE is healthy: $HEALTHY"
	done;

	if [ $HEALTHY -eq 0 ];
	then
		echo "SQL Server Instance $SERVER_INSTANCE is unhealthy."

		exit 1;
	else
		echo "Sql Server Instance $SERVER_INSTANCE is healthy."
	fi;
};

buildPlaylist() {
	if [ -z "$1" ];
	then
		PLAYLIST=$2
	else
		PLAYLIST=$1,$2
	fi;
};

outro() {
	echo "\t\t" '   .--./""---.._             '
	echo "\t\t" '  /`.-.|      //\\           '
	echo "\t\t" '   /   \     /::|| `--.      '
	echo "\t\t" '        `.  ||::// ` `--.    '
	echo "\t\t" '          `.\\://  `-. `-.   '
	echo "\t\t" '            '--' `. `.       '
	echo "\t\t" '                '.   .  '-.  '
};

main