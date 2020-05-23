#!/bin/bash
#
#This script pings a list of servers and reports their status

SERVER_FILE='/vagrant/servers'

if [[ ! -e "${SERVER_FILE}" ]]
then
	echo "Cannot open ${SERVER_FILE}." >&2
	exit 1
fi

for SERVER in $(cat ${SERVER_FILE})
do
	echo "PINGING ${SERVER}"
	ping -c 1 ${SERVER} &> /dev/null
	if [[ ${?} -eq 0 ]]
	then
		echo "${SERVER} is up and running"
	else
		echo "${SERVER} is down!"
	fi
done


