#!/usr/bin/env bash

sudo pacman --needed --noconfirm -S git base-devel
../../../.base/_aur.sh yay
yay --needed --noconfirm -S git-credential-manager-bin