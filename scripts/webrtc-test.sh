/bin/bash

# Define default values for sessions and tabs per session
default_sessions=1
default_tabs_per_session=2

# Parse command line arguments
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -s|--sessions)
    sessions="$2"
    shift # past argument
    shift # past value
    ;;
    -t|--tabs-per-session)
    tabs_per_session="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    shift # past argument
    ;;
esac
done

# Use default values if sessions or tabs_per_session are not set
sessions="${sessions:-$default_sessions}"
tabs_per_session="${tabs_per_session:-$default_tabs_per_session}"

# Define an array of URLs
urls=(
  "https://meet.hivenetes.com/abhi1"
  "https://meet.hivenetes.com/abhi2"
  "https://meet.hivenetes.com/abhi3"
)

# Loop through each URL and run the Docker command
for url in "${urls[@]}"
do
  docker run -it --rm \
    -v /dev/shm:/dev/shm \
    ghcr.io/vpalmisano/webrtcperf \
    --url="$url" \
    --url-query='#config.prejoinPageEnabled=false&userInfo.displayName=Participant($s-$t)' \
    --sessions="$sessions" \
    --tabs-per-session="$tabs_per_session"
done

