#!/bin/bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

echo -e "${BLUE}${BOLD}KDE 6 Arch Installer by happy2234${NC}"

echo -e "${YELLOW}Starting the installation of KDE Plasma and cleaning up the system...${NC}"

# Update the system
echo -e "${YELLOW}Updating the system...${NC}"
sudo pacman -Syu --noconfirm

# Install KDE Plasma and related packages
echo -e "${YELLOW}Installing KDE Plasma and related packages...${NC}"
sudo pacman -S --noconfirm plasma kde-applications sddm

# Enable SDDM for KDE
echo -e "${YELLOW}Enabling SDDM for KDE...${NC}"
sudo systemctl disable sddm.service  # Disable Hyprland's SDDM if it exists
sudo systemctl enable sddm.service
sudo systemctl start sddm.service

# Applications to keep
keep_packages=(
    "google-chrome"
    "firefox"
    "code"
    "spotify"
    "telegram-desktop"
    "discord"
    "kitty"
)

# List of default KDE packages
default_kde_packages=(
    "plasma"
    "kde-applications"
    "sddm"
    # Add other default KDE packages as needed
)

# Remove non-default applications and packages
echo -e "${YELLOW}Removing non-default applications and packages...${NC}"
installed_packages=$(pacman -Qq)
packages_to_remove=()

for pkg in $installed_packages; do
    if [[ ! " ${default_kde_packages[@]} ${keep_packages[@]} " =~ " ${pkg} " ]]; then
        packages_to_remove+=("$pkg")
    fi
done

if [ ${#packages_to_remove[@]} -ne 0 ]; then
    sudo pacman -Rns --noconfirm "${packages_to_remove[@]}"
else
    echo -e "${GREEN}No non-default packages to remove.${NC}"
fi

# Clean up orphaned packages
echo -e "${YELLOW}Cleaning up orphaned packages...${NC}"
orphans=$(pacman -Qtdq)
if [ -n "$orphans" ]; then
    sudo pacman -Rns --noconfirm $orphans
else
    echo -e "${GREEN}No orphaned packages to remove.${NC}"
fi

echo -e "${GREEN}${BOLD}Installation and cleanup complete. KDE Plasma is now set up.${NC}"