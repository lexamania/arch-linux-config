#! /bin/bash

#add executable rights "chmode +x file_name"

PACMAN_CONF_PATH="/etc/pacman.conf"

AUR_PATH="$HOME/aur"
GIT_PATH="$HOME/git"
BACKUP_PATH="$HOME/backup"

AUR_LINK="https://aur.archlinux.org/"
GITHUB_LINK="https://github.com/"

_mkdir_if_need() {
    mkdir -p $1
}

_install_aur() {
    local full_link="${AUR_LINK}${1}"
    local full_path="${AUR_PATH}/${1}"
	git -C ${AUR_PATH} clone ${full_link}
	makepkg -si -D ${full_path} --needed --noconfirm
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

enable_multilyb() {
    cp ${PACMAN_CONF_PATH} "${BACKUP_PATH}/pacman.conf"
    sudo sed -i -e '/#\[multilib\]/,+1s/^#//' ${PACMAN_CONF_PATH}
}

set_ML4W_screen() {
    full_link="${GITHUB_LINK}/mylinuxforwork/dotfiles"
    new_name="ML4W"
	git -C ${GIT_PATH} clone ${full_link} ${new_name}
    `${GIT_PATH}/${new_name}/setup_arch.sh`
}

set_base() {
    sudo pacman --needed --noconfirm -S git gum less pipewire flatpak waybar firefox
}

get_base_apps() {
    sudo pacman --needed --noconfirm -S discord obs-studio spotify-launcher telegram-desktop bitwarden
}

get_development_apps() {
    sudo pacman --needed --noconfirm -S blender gimp krita
    _install_aur "unityhub"
    _install_aur "visual-studio-code-bin"
}

get_games() {
    sudo pacman --needed --noconfirm -S steam
    _install_aur "heroic-games-launcher-bin"
    flatpak install bottles
}

#start

_mkdir_if_need $AUR_PATH
_mkdir_if_need $GIT_PATH
_mkdir_if_need $BACKUP_PATH

enable_multilyb
sudo pacman -Syu
set_base

echo "Custom installation?"
if _yes_no_permission; then

	if _install_permission "BASE USER APPS"; then 
		get_base_apps
	fi

	if _install_permission "GAME DEVELOPER PACK"; then 
		get_development_apps
	fi

	if _install_permission "GAMER PACK"; then 
    		get_games
	fi

	if _install_permission "ML4W ENVIRONMENT"; then 
    		set_ML4W_screen
	fi
else
	get_base_apps
	get_development_apps
	get_games
	set_ML4W_screen
fi
