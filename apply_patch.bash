#!/bin/bash
curl -sqL https://github.com/itzg/rcon-cli/releases/download/1.6.4/rcon-cli_1.6.4_linux_amd64.tar.gz | tar -xz -C /usr/local/bin
RELEASES_INFO=$(curl -L -s -H "Accept: application/vnd.github+json" https://api.github.com/repos/VeroFess/PalWorld-Server-Unoffical-Fix/releases | jq -r '.[0]')
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
    break
done

sed -i "2i sudo chown -R steam:steam /home/steam/Steam/steamapps/common/PalServer/Pal/Saved/" /home/steam/Steam/steamapps/common/PalServer/PalServer.sh