#!/usr/bin/env bash

../.base/_start_session.sh

../.base/print/message.sh "Pacman configuration started..."
./scripts/configurations/enable_pacman_multilib.sh
./scripts/configurations/enable_pacman_parallel_downloads.sh
./scripts/configurations/update_system.sh

../.base/print/message.sh "System configuration started..."
./scripts/configurations/enable_bluetooth.sh
./scripts/configurations/enable_firewall.sh

../.base/print/message.sh "Installing system applications..."
./scripts/installers/install_yay.sh
./scripts/installers/install_system_apps.sh
./scripts/installers/install_pipewire.sh
./scripts/installers/install_disk_tools.sh
./scripts/installers/install_fonts.sh
./scripts/installers/install_media_support.sh

../apps/konsole/setup.sh