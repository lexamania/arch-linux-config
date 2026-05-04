#!/usr/bin/env bash

../base/_pacman.sh ufw

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo systemctl enable ufw