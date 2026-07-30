#!/usr/bin/env bash

../base/_pacman.sh npm nodejs dotnet-sdk aspnet-runtime
../base/_yay.sh visual-studio-code-bin

../custom/setup_docker.sh