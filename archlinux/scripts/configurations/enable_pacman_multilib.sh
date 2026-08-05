#!/usr/bin/env bash

local pacman_conf="/etc/pacman.conf"
sudo sed -i -e '/#\[multilib\]/,+1s/^#//' ${pacman_conf}