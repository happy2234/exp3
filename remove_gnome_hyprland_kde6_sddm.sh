#!/bin/bash

echo "Starting removal of GNOME or Hyprland desktop and related packages..."

# List of packages to remove (GNOME, Hyprland, and other non-KDE packages)
packages_to_remove=(
    "gnome-shell"
    "gnome-session"
    "gnome-control-center"
    "gnome-terminal"
    "nautilus"
    "hyprland"
    # Add other GNOME or Hyprland related packages as needed
)

# Remove GNOME, Hyprland, and related packages
echo "Removing GNOME or Hyprland desktop and related packages..."
sudo pacman -Rns --noconfirm "${packages_to_remove[@]}"

# Clean up orphaned packages
echo "Cleaning up orphaned packages..."
orphans=$(pacman -Qtdq)
if [ -n "$orphans" ]; then
    sudo pacman -Rns --noconfirm $orphans
else
    echo "No orphaned packages to remove."
fi

# Remove existing SDDM theme (assuming Hyprland or non-KDE theme)
echo "Removing existing SDDM theme..."
sudo pacman -Rns --noconfirm sddm-theme-hyprland  # Replace with actual Hyprland theme package name if different

# Install KDE 6 SDDM theme (adjust command once KDE 6 themes are available)
echo "Installing KDE 6 SDDM theme..."
# Replace with appropriate command once KDE 6 theme is available
sudo pacman -S --noconfirm sddm-kde6-theme

# Enable SDDM for KDE
echo "Enabling SDDM for KDE..."
sudo systemctl enable sddm.service
sudo systemctl start sddm.service

echo "Removal of GNOME or Hyprland desktop and SDDM theme replacement complete."