FROM cm2network/steamcmd

LABEL maintainer=https://github.com/StandWithCCP/Palworld-Docker

COPY apply_patch.bash /usr/local/bin/

ENV TZ=Asia/Shanghai

USER root
RUN apt update -qq \
    && apt install -yqq --no-install-recommends jq \
    && apt clean

USER steam
WORKDIR /home/steam/steamcmd
RUN ./steamcmd.sh +login anonymous +app_update 1007 +app_update 2394010 validate +quit \
    && cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/.steam/sdk64 \
    && apply_patch.bash

WORKDIR /home/steam/Steam/steamapps/common/PalServer/

EXPOSE 8211/udp

ENTRYPOINT [ "./PalServer.sh" ]