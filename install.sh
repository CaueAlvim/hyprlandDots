#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Update system
pacman -Syu

# Create folders system
pacman -S xdg-user-dirs
xdg-user-dirs-update


# Making .config and main folders
cd $builddir
mkdir -p /home/$username/.config

# Making backup of bashrc
mv .bashrc .bashrcBak

# Moving resources
cd /home/$username/hyprlandDots/
mv .bashrc /home/$username/
mv .config/ /home/$username/
mv Wallpapers/ /home/$username/Imagens/

# Ensuring that the user with UID 1000 owns all files and directories within their home directory. 
# chown -R $username:$username /home/$username

# Install package list
pacman -Sy hyprland kitty xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk polkit polkit-gnome ufw

# Installing Essential Programs 
pacman -Sy waybar swaybg dunst nautilus file-roller htop nano starship ttf-inconsolata-nerd

# Installing Firefox
pacman -Sy firefox

# Config ufw
ufw default deny
ufw enable
systemctl enable ufw
