#!/bin/bash

AdminPassword=$1
if [ -z "$AdminPassword" ]; then
    exit 0
fi
meminfo=$(cat /proc/meminfo)
memavailable=$(echo "$meminfo" | grep MemAvailable | awk '{print $2}')
buffers=$(echo "$meminfo" | grep Buffers | awk '{print $2}')
cached=$(echo "$meminfo" | grep -v SwapCached | grep Cached | awk '{print $2}')
mem_free=$(($memavailable+$buffers+$cached))

if [ $mem_free -lt 2097152 ]; then
    rcon-cli --password $AdminPassword Shutdown 240 "Server is shutting down in 4 minutes due to low memory."
fi