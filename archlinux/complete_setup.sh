#!/usr/bin/env bash

../.base/_start_session.sh

../.base/print/message.sh "Base system configuration..."
./minimal_setup.sh

../.base/print/message.sh "Installing user applications..."
./scripts/installers_packs/install_pack_social.sh
./scripts/installers_packs/install_pack_games.sh
./scripts/installers_packs/install_pack_creativity.sh
./scripts/installers_packs/install_pack_stream.sh
./scripts/installers_packs/install_pack_development.sh
./scripts/installers_packs/install_pack_game_development.sh