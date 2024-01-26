#!/bin/bash
tmp_id=$(docker create standwithccp/palworld:latest)
docker cp $id:/home/steam/Steam/steamapps/common/PalServer/Pal/Saved $SAVE_PATH
docker rm -v $id

