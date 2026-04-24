#!/usr/bin/env bash

_mkdir_if_need() {
    mkdir -p $1
}

_pacman() {
    sudo pacman --needed --noconfirm -S "$@"
}

enable_firewall() {
    _pacman ufw
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw enable
    sudo systemctl enable ufw
}

configure_pipewire(){
    _mkdir_if_need "$HOME/.config/pipewire/pipewire-pulse.conf.d"
    cp configs/pipewire/pipewire-pulse.conf.d/10-disable-auto-gain.conf "$HOME/.config/pipewire/pipewire-pulse.conf.d/"
}

fix_xboxpad() {
    _pacman xboxdrv
    sudo modprobe -r xpad
    sudo xboxdrv --silent
}

enable_firewall
configure_pipewire
fix_xboxpad