#!/usr/bin/env bash

sudo pacman --needed --noconfirm -S ufw

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo systemctl enable ufw