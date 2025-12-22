#! /bin/bash

#add executable rights "chmode +x install_hyperland.sh"

GITHUB_LINK="https://github.com/"

GIT_PATH="$HOME/.local/share/downloaded_files/git_files"

set_ML4W_screen() {
    full_link="${GITHUB_LINK}/mylinuxforwork/dotfiles"
    new_name="ML4W"
	git -C ${GIT_PATH} clone ${full_link} ${new_name}
    `${GIT_PATH}/${new_name}/setup_arch.sh`
}

install_hyperland_apps() {
    _pacman hyprutils waybar pipewire wireplumber hyprpolkitagent xdg-desktop-portal-hyprland slurp grim-hyprland hyprland-qt-support
    _pacman hyprpaper hyprpicker hyprlock hypridle hyprcursor hyprsunset rofi-wayland swappy
}

install_hyperland_apps
set_ML4W_screen