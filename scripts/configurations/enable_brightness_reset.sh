#!/usr/bin/env bash

mkdir -p ~/.config/systemd/user
cp ../../config/systemd/user/reset-brightness.service ~/.config/systemd/user/reset-brightness.service

systemctl --user daemon-reexec
systemctl --user enable reset-brightness.service