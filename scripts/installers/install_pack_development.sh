#!/usr/bin/env bash

../base/_pacman.sh npm nodejs dotnet-sdk
../base/_yay.sh visual-studio-code-bin

../custom/setup_docker.sh