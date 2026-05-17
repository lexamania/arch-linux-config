#! /bin/bash

cp -r ../src/. ~/

plasma-apply-lookandfeel lexamania
systemctl --user restart plasma-plasmashell