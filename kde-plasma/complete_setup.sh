#!/usr/bin/env bash

# preconfiguration + all user apps installation

../scripts/print/message.sh "System configuration..."
../scripts/complete_setup.sh

../scripts/print/message.sh "Theme setting..."
./set_theme.sh