#!/usr/bin/env bash
nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz home-manager
nix-channel --update
echo "--------------------"
echo "Home Manager Added!"
echo ">>> Re-login and run:"
echo "nix-shell '<home-manager>' -A install"
