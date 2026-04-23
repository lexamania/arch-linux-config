#!/usr/bin/env bash

_mkdir_if_need() {
    mkdir -p $1
}

_mkdir_if_need "$HOME/.config/pipewire/pipewire-pulse.conf.d"
cp configs/pipewire/pipewire-pulse.conf.d/10-disable-auto-gain.conf "$HOME/.config/pipewire/pipewire-pulse.conf.d/"