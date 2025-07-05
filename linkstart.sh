#! /bin/bash

# 1. open vpn

# 2. install the command line tools(must)
xcode-select --install

# 3. clone the nix dotfile repository
git clone https://github.com/Fy-Apple/nix.git ~/nix-darwin

# 4. create a symlink to /etc/nix-darwin
sudo ln -s ~/nix-darwin /etc/nix-darwin

# 5. install determined nix, choose no to avoid install nix for xxx
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# 6. Installing nix-darwin
sudo nix run nix-darwin/master#darwin-rebuild -- switch

# 7. rebuild
sudo darwin-rebuild switch --impure --show-trace --flake /etc/nix-darwin#HUAWEI-MateBook-Fold
