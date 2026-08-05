#!/usr/bin/env bash

sudo pacman --needed --noconfirm -S docker docker-compose

# call this to allow use docker without 'sudo'. replace $username with your username
# sudo gpasswd -a $username docker
# or
# sudo usermod -aG docker $username

sudo systemctl enable docker.socket
sudo systemctl start docker.socket