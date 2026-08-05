#!/usr/bin/env bash

sudo pacman --needed --noconfirm -S npm nodejs dotnet-sdk aspnet-runtime
yay --needed --noconfirm -S visual-studio-code-bin

../custom/setup_docker.sh