#!/usr/bin/env bash

# controller should be connected before running this script
 
yay --needed --noconfirm -S xboxdrv
sudo modprobe -r xpad
sudo xboxdrv --silent