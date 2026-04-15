#!/bin/bash
#===============================
# Terminal Setup script !!
#===============================

sudo apt install -y fish fastfetch
sleep 1
curl -sS https://starship.rs/install.sh | sh
sleep 1

mkdir -p ~/.config
cp -r ~/fancy-desktop/assets/dotfiles/.config/* ~/.config/
chsh -s /usr/bin/fish


sudo mkdir -p /root/.config/
sudo cp -r ~/fancy-desktop/assets/dotfiles/.config/* /root/.config/
sudo chsh -s /usr/bin/fish

echo "Your Terminal is ready"
