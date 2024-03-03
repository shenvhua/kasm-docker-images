#!/bin/bash

docker build --platform linux/amd64 -t obsidian:dev -f dockerfile-kasm-obsidian .



docker build --platform linux/amd64 -t obsidian:dev -f dockerfile-kasm-obsidian .
docker run --rm  -it --shm-size=512m -p 6901:6901 -e VNC_PW=123456 obsidian:dev