#!/bin/bash
source .env
rm -rf $SAVE_PATH
tmp_id=$(docker run -d standwithccp/palworld:latest)
docker stop $tmp_id
docker cp $tmp_id:/home/steam/Steam/steamapps/common/PalServer/Pal/Saved/ $SAVE_PATH
docker rm $tmp_id

