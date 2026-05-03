#! /bin/bash

_pacman() {
    sudo pacman --needed --noconfirm -S "$@"
}

_install_plasma_apps() {
    _pacman plasma-desktop plasma-nm plasma-pa plasma-systemmonitor sddm-kcm
}

_install_plasma_apps