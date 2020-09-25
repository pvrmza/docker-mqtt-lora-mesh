#!/bin/sh

/usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf & 
cd /root/mesh-server
node app.js
