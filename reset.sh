#!/bin/bash

# killall node

sudo systemctl stop postgresql.service 2>/dev/null

#fnm use 14

rm -rf temp 2>/dev/null
rm -rf dist 2>/dev/null

sudo docker stop $(sudo docker ps -a -q) 2>/dev/null
sudo docker rm $(sudo docker ps -a -q) 2>/dev/null
sudo docker volume rm $(sudo docker volume ls -q) 2>/dev/null

sudo docker-compose up -d

sudo docker run --name alke-postgres1 -e POSTGRES_PASSWORD=root -e POSTGRES_USER=postgres -e POSTGRES_DB=postgres -p 5432:5432 -d postgres
sudo docker run --name alke-redis1 -p 6379:6379 -d redis -e ALLOW_EMPTY_PASSWORD=yes --restart always -e REDIS_DISABLE_COMMANDS="FLUSHDB,FLUSHALL"



sudo docker ps -a
echo

# npm run typeorm schema:sync

# npm run typeorm -- migration:generate -n "final"

#echo 'Waiting for postgres to start...'
#sleep 5

#clear
#npm run typeorm -- migration:run


#sudo docker ps -a 
#echo

#sleep 1
#npm run typeorm -- migration:show

