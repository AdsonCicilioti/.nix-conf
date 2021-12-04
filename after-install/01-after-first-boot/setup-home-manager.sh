#!/usr/bin/env bash
if [ ! -f "$HOME/.config/nixpkgs/home.nix" ]; then
	mkdir -p "$HOME"/.config/nixpkgs
	ln -sf "$PWD"/home.nix "$HOME"/.config/nixpkgs/home.nix
fi

nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz home-manager
nix-channel --update
echo "--------------------"
echo "Home Manager Added!"
echo "--------------------"
echo ">>> Re-login and run:"
echo "nix-shell '<home-manager>' -A install"
