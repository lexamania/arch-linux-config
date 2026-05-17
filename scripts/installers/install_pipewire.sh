#!/usr/bin/env bash

../base/_pacman.sh pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber lib32-pipewire lib32-libpulse
../configurations/configure_pipewire.sh