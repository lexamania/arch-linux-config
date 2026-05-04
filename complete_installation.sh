#!/usr/bin/env bash

./scripts/base/_start_session.sh

./scripts/configurations/enable_pacman_multilib.sh
./scripts/configurations/enable_pacman_parallel_downloads.sh
./scripts/configurations/update_system.sh

./scripts/installers/install_yay.sh

./scripts/configurations/enable_bluetooth.sh
./scripts/configurations/enable_firewall.sh
./scripts/configurations/enable_brightness_reset.sh
./scripts/configurations/configure_xboxpad.sh

./scripts/installers/install_default_apps.sh
./scripts/installers/install_pipewire.sh
./scripts/installers/install_disk_tools.sh
./scripts/installers/install_fonts.sh

./scripts/installers/install_pack_user.sh
./scripts/installers/install_pack_media.sh
./scripts/installers/install_pack_gamer.sh
./scripts/installers/install_pack_creativity.sh
./scripts/installers/install_pack_developer.sh
./scripts/installers/install_pack_game_development.sh
./scripts/installers/install_pack_streamer.sh
./scripts/installers/install_pack_fun.sh
