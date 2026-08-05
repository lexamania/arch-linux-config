#!/usr/bin/env bash

# clear orphan dependencies
sudo pacman -Rns $(pacman -Qtdq)

# clear pacman cache
sudo pacman -Sc --noconfirm
