#!/usr/bin/env bash

../base/_pacman.sh pipewire pipewire-pulse pipewire-alsa pipewire-jack

../base/_pacman.sh git base-devel
../base/_aur.sh yay
../base/_yay.sh git-credential-manager-bin