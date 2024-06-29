# KDE 6 SDDM Theme and Desktop Environment Removal Script

This script automates the removal of GNOME or Hyprland desktop environments and their related packages, replacing any existing SDDM theme with the KDE 6 theme on an Arch Linux system.

## Usage

1. **Download the Script:**
   - Clone or download the `remove_gnome_hyprland_and_kde6_sddm.sh` script to your Arch Linux system.

2. **Make the Script Executable:**
   - Open a terminal.
   - Navigate to the directory where you saved the script.
   - Run the following command to make it executable:
     ```bash
     chmod +x remove_gnome_hyprland_and_kde6_sddm.sh
     ```

3. **Run the Script:**
   - Execute the script with superuser privileges by running:
     ```bash
     sudo ./remove_gnome_hyprland_and_kde6_sddm.sh
     ```
   - Follow the prompts and monitor the terminal for any messages or errors.

4. **Additional Notes:**
   - Ensure you have sudo privileges to execute pacman commands and remove packages from your system.
   - Adjust the script if necessary, especially the list of packages (`packages_to_remove`) or SDDM theme names.
   - After execution, your system will be cleaned of GNOME or Hyprland desktop components, with KDE 6 and its SDDM theme installed.

## License

This script is provided under the MIT License. See the LICENSE file for more details.