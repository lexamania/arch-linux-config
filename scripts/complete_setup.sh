#!/usr/bin/env bash

./base/_start_session.sh

./print/message.sh "Base system configuration..."
./minimal_setup.sh

./print/message.sh "Installing user applications..."
./installers_packs/install_pack_social.sh
./installers_packs/install_pack_games.sh
./installers_packs/install_pack_creativity.sh
./installers_packs/install_pack_stream.sh
./installers_packs/install_pack_development.sh
./installers_packs/install_pack_game_development.sh