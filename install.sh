#! /bin/bash

#add executable rights "chmode +x file_name"

PACMAN_CONF_PATH="/etc/pacman.conf"

BASE_DIR="$HOME/.local/share/lexamania"

AUR_PATH="$BASE_DIR/aur_files"
GIT_PATH="$BASE_DIR/git_files"
BACKUP_PATH="$BASE_DIR/backup"

AUR_LINK="https://aur.archlinux.org/"
GITHUB_LINK="https://github.com/"

#----------------UTILS---------------

_mkdir_if_need() {
    mkdir -p $1
}

_yes_no_permission() {
    local yn=$(gum choose "yes" "no")
    if [ "$yn" == "yes" ]; then
	return 0 #true
    else 
	return 1 #false
    fi
}

_install_permission() {
    echo "DO YOU WANT TO INSTALL ${1}?"
    return $(_yes_no_permission)
}

_create_dir_tree() {
    _mkdir_if_need $BASE_DIR
    _mkdir_if_need $AUR_PATH
    _mkdir_if_need $GIT_PATH
    _mkdir_if_need $BACKUP_PATH
}

_enable_multilyb() {
    cp ${PACMAN_CONF_PATH} "${BACKUP_PATH}/pacman.conf"
    sudo sed -i -e '/#\[multilib\]/,+1s/^#//' ${PACMAN_CONF_PATH}
}

#------------------------------------

#--------CUSTOM INSTALLATIONS--------

_aur() {
    local full_link="${AUR_LINK}${1}"
    local full_path="${AUR_PATH}/${1}"
	git -C ${AUR_PATH} clone ${full_link}
	makepkg -si -D ${full_path} --needed --noconfirm
}

_pacman() {
    sudo pacman --needed --noconfirm -S "$@"
}

_yay() {
    yay --needed --noconfirm -S "$@"
}

#------------------------------------

#-----------INSTALLATIONS------------

set_ML4W_screen() {
    full_link="${GITHUB_LINK}/mylinuxforwork/dotfiles"
    new_name="ML4W"
	git -C ${GIT_PATH} clone ${full_link} ${new_name}
    `${GIT_PATH}/${new_name}/setup_arch.sh`
}

install_base_apps() {
    _pacman git
    _aur "yay"

    _yay git-credential-manager-bin

    # main apps
    _pacman gum less kitty firefox dolphin meld libreoffice-fresh

    # video player
    _pacman mpv mplayer celluloid

    _pacman hyprutils waybar pipewire wireplumber hyprpolkitagent xdg-desktop-portal-hyprland slurp grim-hyprland hyprland-qt-support
    _pacman hyprpaper hyprpicker hyprlock hypridle hyprcursor hyprsunset rofi-wayland swappy
}

install_user_apps() {
    _pacman discord obs-studio spotify-launcher telegram-desktop bitwarden
}

install_development_pack() {
    # scons - c build for godot
    _pacman blender godot-mono scons gimp krita
    _yay unityhub visual-studio-code-bin
}

install_games_pack() {
    _pacman steam wine wine-mono
    _yay bottles heroic-games-launcher-bin
}

#------------------------------------

#----------------START---------------

_create_dir_tree
_enable_multilyb
sudo pacman -Syu

install_base_apps

echo "Custom installation?"
if _yes_no_permission; then

	if _install_permission "BASE USER APPS"; then 
		install_user_apps
	fi

	if _install_permission "GAME DEVELOPER PACK"; then 
		install_development_pack
	fi

	if _install_permission "GAMER PACK"; then 
    		install_games_pack
	fi

	if _install_permission "ML4W ENVIRONMENT"; then 
    		set_ML4W_screen
	fi
else
	install_user_apps
	install_development_pack
	install_games_pack
	set_ML4W_screen
fi