#!/usr/bin/env bash

tput smcup
trap 'tput rmcup' EXIT

PACMAN_CONF_PATH="/etc/pacman.conf"

BASE_DIR="$HOME/.local/share/downloaded_files"

GIT_PATH="$BASE_DIR/git_files"
BACKUP_PATH="$BASE_DIR/backup"

AUR_LINK="https://aur.archlinux.org/"

#------------ECHO_UTILS--------------

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo_separation() {
    echo "════════════════════════════════════════════════════"
}

echo_title() {
    echo_separation
    echo "  $1"
    echo_separation
    echo ""
}

echo_option() {
    echo -e "${BLUE}$1)${NC} $2"
}

echo_line() {
    echo "  $1"
    echo ""
}

echo_success() {
    echo -e "${GREEN}✓ $1${NC}"
    echo ""
}

echo_error() {
    echo -e "${RED}✗ $1${NC}"
    echo ""
}

#----------------UTILS---------------

_mkdir_if_need() {
    mkdir -p $1
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

_enable_firewall() {
    sudo pacman -S ufw
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw enable
    sudo systemctl enable ufw
}

_fix_xbox() {
    sudo pacman -S xboxdrv
    sudo modprobe -r xpad
    sudo xboxdrv --silent
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
    _aur yay

    _yay git-credential-manager-bin

    # main apps
    _pacman gum less curl neofetch unzip p7zip

    # video apps
    _pacman mpv mplayer

    # fonts
    _pacman ttf-croscore ttf-roboto
    _yay ttf-ms-fonts noto-fonts-emoji
}

install_user_apps() {
    _pacman konsole dolphin 
    _pacman kodi libnss3 libxss
    _pacman spotify-launcher telegram-desktop firefox thunderbird
    _yay vesktop
}

install_development_pack() {
    _pacman nodejs npm docker docker-compose
    _yay dotnet-sdk-9.0-bin dotnet-sdk-bin
    _yay visual-studio-code-bin
}

install_creative_pack() {
    _pacman gimp krita obs-studio blender
    _yay pureref pixelorama
    _yay obs-vkcapture lib32-obs-vkcapture
}

install_game_development_pack() {
    # scons - c build for godot
    _pacman godot-mono scons
    _yay unityhub visual-studio-code-bin
}

install_gamer_pack() {
    _pacman steam
    _yay bottles
}

install_fun_apps() {
    _pacman kstars
}


#------------------------------------

#----------------START---------------

echo_title "Archlinux Apps - Installation"

echo_line "Preparing Installation..."
preinstall
_enable_firewall
_fix_xbox

echo_line "Installing default apps..."
install_base_apps

while true; do

    echo_title "Menu:"
    echo_option 1 "Install all"
    echo_option 2 "Install user apps"
    echo_option 3 "Install creativity pack"
    echo_option 4 "Install software development pack"
    echo_option 5 "Install game development pack"
    echo_option 6 "Install gamer pack"
    echo_option 7 "Install fun apps"
    echo_option 0 "Exit"
    echo ""

    read -rp "Enter your choices(1 3 4 ...; 6; or 0): " input
    read -ra choices <<< "$input"

    for choice in "${choices[@]}"; do
        case $choice in
            1)
                install_user_apps
                install_creative_pack
                install_development_pack
                install_game_development_pack
                install_gamer_pack
                install_fun_apps
                echo_success "All apps installed successfully!"
                ;;
            2)
                install_user_apps
                echo_success "User apps installed successfully!"
                ;;
            3)
                install_creative_pack
                echo_success "Crreativity apps installed successfully!"
                ;;
            4)
                install_development_pack
                echo_success "Software development apps installed successfully!"
                ;;
            5)
                install_game_development_pack
                echo_success "Game development apps installed successfully!"
                ;;
            6)
                install_gamer_pack
                echo_success "Gamer apps installed successfully!"
                ;;
            7)
                install_fun_apps
                echo_success "Fun apps installed successfully!"
                ;;
            0)
                exit 0
                ;;
            *)
                echo_error "Invalid choice: $choice"
                ;;
        esac
    done
done

exit 0
