#!/usr/bin/env bash

../base/_yay.sh xboxdrv
sudo modprobe -r xpad
sudo xboxdrv --silent