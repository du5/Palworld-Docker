#!/bin/bash
RELEASES_INFO=$(curl -L -s -H "Accept: application/vnd.github+json" https://api.github.com/repos/VeroFess/PalWorld-Server-Unoffical-Fix/releases | jq -r '.[1]')
RELEASES_VERSION=$(echo $RELEASES_INFO | jq -r '.tag_name')

for row in $(echo "${RELEASES_INFO}" | jq -r '.assets[] | @base64'); do
    _jq() {
        echo ${row} | base64 --decode | jq -r ${1}
    }
    if [[ $(_jq '.name') == *.exe ]]; then
        continue
    fi
    PATH_FILE=$(_jq '.browser_download_url')
    curl -sqL "$PATH_FILE" -o /home/steam/Steam/steamapps/common/PalServer/Pal/Binaries/Linux/PalServer-Linux-Test
    return
done
