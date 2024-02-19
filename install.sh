#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Update system
pacman -Syu

# Create folders system
pacman -S xdg-user-dirs

xdg-user-dirs-update

ls -la

cd

# Making backup of bashrc
mv .bashrc .bashrcBak

# Moving resources
cd ~/hyprlandDots/
cp bashrc ~/.bashrc
cp -r dotfiles/. ~/.config/
mv Wallpapers/ ~/Imagens/

# Install package list
pacman -S hyprland kitty xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk polkit polkit-gnome ufw

# Installing Essential Programs 
pacman -S waybar swaybg dunst nautilus file-roller htop nano starship ttf-inconsolata-nerd

# Installing Firefox
pacman -S firefox

# Config ufw
ufw default deny
ufw enable
systemctl enable ufw
