#!/usr/bin/env bash

# controller should be connected before running this script
 
../base/_yay.sh xboxdrv
sudo modprobe -r xpad
sudo xboxdrv --silent