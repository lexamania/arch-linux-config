#!/usr/bin/env bash

local pacman_conf="/etc/pacman.conf"
sudo sed -i -e 's/^#ParallelDownloads = 5/ParallelDownloads = 5/' ${pacman_conf}