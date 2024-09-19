#!/bin/bash

# Default values
default_sessions=1
default_tabs_per_session=2
default_url="https://meet.hello.com/benchmark"

# Parse command line arguments
while getopts ":s:t:f:" opt; do
  case $opt in
    s) sessions="$OPTARG" ;;
    t) tabs_per_session="$OPTARG" ;;
    f) urls_file="$OPTARG" ;;
    \?) echo "Invalid option -$OPTARG" >&2; exit 1 ;;
    :) echo "Option -$OPTARG requires an argument" >&2; exit 1 ;;
  esac
done

# Use default values if not set
sessions="${sessions:-$default_sessions}"
tabs_per_session="${tabs_per_session:-$default_tabs_per_session}"

# Read URLs from file or use default
if [ -n "$urls_file" ] && [ -f "$urls_file" ]; then
    mapfile -t urls < "$urls_file"
else
    urls=("$default_url")
fi

# Function to run Docker command
run_docker() {
    docker run -it --rm \
        -v /dev/shm:/dev/shm \
        ghcr.io/vpalmisano/webrtcperf \
        --url="$1" \
        --url-query='#config.prejoinPageEnabled=false&userInfo.displayName=Participant($s-$t)' \
        --sessions="$sessions" \
        --tabs-per-session="$tabs_per_session"
}

# Loop through URLs and run Docker command
for url in "${urls[@]}"; do
    run_docker "$url"
done
