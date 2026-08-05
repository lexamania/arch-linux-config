#!/usr/bin/env bash

local cache="${HOME}/.git-cache"
local aur_link="https://aur.archlinux.org/"
local full_link="${aur_link}${1}"
local full_path="${cache}/${1}"

mkdir -p ${cache}

git -C ${cache} clone ${full_link}
makepkg -si -D ${full_path} --needed --noconfirm