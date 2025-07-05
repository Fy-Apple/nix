#! /bin/bash

# install the command line tools(must)
xcode-select --install

# read this file to disable th SIP for yabai
# https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection

# clone the nix dotfile repository
git clone https://github.com/fy-apple/nix-builder.git /etc/nix-darwin
sudo chown $(id -nu):$(id -ng) /etc/nix-darwin
cd /etc/nix-darwin


# install th determined nix, choose no to avoid install nix for xxx
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

sudo nix run nix-darwin/master#darwin-rebuild -- switch

# rebuild
sudo darwin-rebuild switch --impure --show-trace --flake /etc/nix-darwin#HUAWEI-MateBook-Fold