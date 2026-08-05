#!/usr/bin/env bash

sudo pacman --needed --noconfirm -S bluez bluez-utils
sudo systemctl enable bluetooth
sudo systemctl start bluetooth