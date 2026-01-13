#! /bin/bash

#add executable rights "chmode +x install.sh"

PACMAN_CONF_PATH="/etc/pacman.conf"

BASE_DIR="$HOME/.local/share/downloaded_files"

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
    echo "INSTALL ${1}?"
    return $(_yes_no_permission)
}

_create_dir_tree() {
    _mkdir_if_need $BASE_DIR
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
    local full_path="${GIT_PATH}/${1}"
	git -C ${GIT_PATH} clone ${full_link}
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

preinstall() {
    _create_dir_tree
    _enable_multilyb
    sudo pacman -Syu
}

install_base_apps() {
    _pacman git base-devel
    _aur "yay"

    _yay git-credential-manager-bin

    # main apps
    _pacman gum less curl neofetch unzip p7zip

    # video apps
    _pacman mpv mplayer
}

install_user_navigation_apps() {
    _pacman konsole dolphin 
}

install_user_apps() {
    _pacman discord spotify-launcher telegram-desktop firefox thunderbird kodi
}

install_development_pack() {
    _pacman nodejs docker docker-compose
    _pacman postgresql
    _yay dotnet-sdk-9.0-bin dotnet-sdk-bin
    _yay visual-studio-code-bin pgadmin4-desktop
}

install_creative_pack() {
    _pacman gimp krita obs-studio blender kdenlive
    _yay pureref pixelorama
    _yay obs-vkcapture lib32-obs-vkcapture
}   

install_game_development_pack() {
    # scons - c build for godot
    _pacman godot-mono scons
    _yay unityhub visual-studio-code-bin
}

install_games_pack() {
    _pacman steam wine wine-mono
    _yay bottles heroic-games-launcher-bin
}

#------------------------------------

#----------------START---------------

preinstall
install_base_apps

if _install_permission "ALL"; then
    install_user_apps
    install_user_navigation_apps
    install_creative_pack
    install_development_pack
    install_game_development_pack
    install_games_pack
else
	if _install_permission "USER APPS"; then 
		install_user_apps
	fi

	if _install_permission "USER NAVIGATION APPS"; then 
		install_user_navigation_apps
	fi

	if _install_permission "CREATIVITY PACK"; then 
		install_creative_pack
	fi

	if _install_permission "DEVELOPER PACK"; then 
		install_development_pack
	fi

	if _install_permission "GAME DEVELOPER PACK"; then 
		install_game_development_pack
	fi

	if _install_permission "GAMER PACK"; then 
    		install_games_pack
	fi
fi
