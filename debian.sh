#!/bin/bash

##### Install some software

# Update package list and upgrade installed packages
sudo add-apt-repository ppa:openvpn-apt-beta/openvpn-beta
sudo apt-get update -y
sudo apt-get upgrade -


# Install general tools
sudo apt-get -y install curl wget ca-certificates gnupg lsb-release

sudo apt-get -y install libreoffice thunderbird firefox

# Install development tools
sudo apt-get -y install git python3 python3-pip golang-go virtualbox

# Check if goland is already installed before installing it
if ! command -v goland &> /dev/null
then
    sudo snap install goland --classic
fi

# Check if pycharm-professional is already installed before installing it
if ! command -v pycharm-professional &> /dev/null
then
    sudo snap install pycharm-professional --classic
fi

## Install docker

# Add Docker's official GPG key and Docker repository to APT sources
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

# Install Docker CE, CLI, and containerd
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Install security tools
sudo apt-get -y install nmap wireshark exiftool openvpn3

## Install communication tools

# Check if slack is already installed before installing it
if ! snap list slack &> /dev/null
then
    sudo snap install slack --classic
fi

# Check if discord is already installed before installing it
if ! snap list discord &> /dev/null
then
    sudo snap install discord
fi

# Mattermost
curl -L -o mattermost-desktop.deb https://releases.mattermost.com/desktop/4.7.0/mattermost-desktop-4.7.0-linux-amd64.deb
sudo dpkg -i mattermost-desktop.deb

##### Setting Visual Style

# Define variables
BLACK="#000000"

# Set wallpaper to plain black
gsettings set org.gnome.desktop.background primary-color "$BLACK"
gsettings set org.gnome.desktop.background secondary-color "$BLACK"
gsettings set org.gnome.desktop.background color-shading-type "solid"
echo "Wallpaper image changed successfully."

# Set theme to dark
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"

# Set up the terminal style
PS1='\[\e[38;2;25;116;210m\]\u\[\e[m\]@\[\e[38;2;179;179;179m\]\h\[\e[m\]:\[\e[0;36m\]\w\[\e[m\] \[\e[0;32m\]\$ \[\e[m\]'

# Set up the tools bar with some of these apps
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'discord_discord.desktop', 'slack_slack.desktop', 'mattermost-desktop_mattermost-desktop.desktop', 'firefox.desktop', 'code_code.desktop', 'pycharm-professional_pycharm-professional.desktop', 'goland_goland.desktop', 'org.gnome.Terminal.desktop']"
