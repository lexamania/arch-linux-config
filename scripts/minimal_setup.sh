#!/usr/bin/env bash

./base/_start_session.sh

./print/message.sh "Pacman configuration started..."
./configurations/enable_pacman_multilib.sh
./configurations/enable_pacman_parallel_downloads.sh
./configurations/update_system.sh

./print/message.sh "System configuration started..."
./configurations/enable_bluetooth.sh
./configurations/enable_firewall.sh

./print/message.sh "Installing system applications..."
./installers/install_yay.sh
./installers/install_system_apps.sh
./installers/install_pipewire.sh
./installers/install_disk_tools.sh
./installers/install_fonts.sh
./installers/install_media_support.sh

../konsole/setup.sh