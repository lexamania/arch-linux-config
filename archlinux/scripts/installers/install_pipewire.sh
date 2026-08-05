#!/usr/bin/env bash

sudo pacman --needed --noconfirm -S pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber lib32-pipewire lib32-libpulse
../configurations/configure_pipewire.sh