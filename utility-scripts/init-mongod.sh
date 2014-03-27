#!/usr/bin/env bash

# create data folders
mkdir 1
mkdir 2
mkdir 3

# start mongod instances
# check by running: mongo --port 27001 ; db.isMaster()
mongod --replSet abc --dbpath 1 --port 27001 --oplogSize 50 --logpath log.1 --logappend --fork
mongod --replSet abc --dbpath 2 --port 27002 --oplogSize 50 --logpath log.2 --logappend --fork
mongod --replSet abc --dbpath 3 --port 27003 --oplogSize 50 --logpath log.3 --logappend --fork
