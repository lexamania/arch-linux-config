#!/usr/bin/env bash

../base/_pacman.sh pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber lib32-pipewire lib32-libpulse

_mkdir_if_need "$HOME/.config/pipewire/pipewire-pulse.conf.d"
cp configs/pipewire/pipewire-pulse.conf.d/10-disable-auto-gain.conf "$HOME/.config/pipewire/pipewire-pulse.conf.d/"