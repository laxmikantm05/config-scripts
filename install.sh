#!/bin/bash

#===========================
# All-in-One install script
#===========================

sudo apt update -y
sudo apt upgrade -y


sudo apt install -y curl wget gum pip sl lolcat figlet fish fastfetch

# Terminal Install Script:
#==========================================
bash ~/fancy-desktop/scripts/terminal.sh
#==========================================

# Fonts Install Script:
#==========================================
bash ~/fancy-desktop/scripts/fonts.sh
#==========================================

# my-apps Install Script:
#==========================================
bash ~/fancy-desktop/scripts/my-apps.sh
#==========================================

