#!/usr/bin/env bash

../base/_pacman.sh bluez bluez-utils
sudo systemctl enable bluetooth
sudo systemctl start bluetooth