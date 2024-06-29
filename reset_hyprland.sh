#!/bin/bash

echo "Starting the factory reset process for Hyprland..."

# Remove Hyprland binaries and libraries
echo "Removing Hyprland binaries and libraries..."
sudo rm -f /usr/local/bin/hyprland
sudo rm -f /usr/local/lib/libhyprland.so

# Remove Hyprland configuration files
echo "Removing Hyprland configuration files..."
rm -rf ~/.config/hypr

# Disable and remove systemd service
if sudo systemctl is-enabled --quiet hyprland.service; then
    echo "Disabling and removing Hyprland systemd service..."
    sudo systemctl disable hyprland.service
    sudo rm -f /etc/systemd/system/hyprland.service
    sudo systemctl daemon-reload
else
    echo "Hyprland systemd service not found."
fi

# Remove associated applications and packages
echo "Removing associated applications and packages..."
packages_to_remove=(
    "wayland"
    "sway"
    # Add any other packages you installed specifically for Hyprland
)

for package in "${packages_to_remove[@]}"; do
    if pacman -Qi $package > /dev/null 2>&1; then
        sudo pacman -Rns $package
    else
        echo "$package not found."
    fi
done

# Clean up orphaned packages
echo "Cleaning up orphaned packages..."
sudo pacman -Rns $(pacman -Qtdq)

# Perform a broader search and remove Hyprland-related files
echo "Searching and removing any remaining Hyprland-related files..."
sudo find / -name "*hyprland*" -exec rm -rf {} \; 2>/dev/null

echo "Hyprland has been reset to factory settings."