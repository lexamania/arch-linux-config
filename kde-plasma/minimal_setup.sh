#!/usr/bin/env bash

# only base apps and preconfiguration

../scripts/print/message.sh "System configuration..."
../scripts/minimal_setup.sh

../scripts/print/message.sh "Theme setting..."
./set_theme.sh