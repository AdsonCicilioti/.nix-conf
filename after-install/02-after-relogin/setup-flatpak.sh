#!/usr/bin/env bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

flatpak install -y nz.mega.MEGAsync com.github.tchx84.Flatseal com.github.hluk.copyq org.flameshot.Flameshot

sudo flatpak override --filesystem=~/.themes
sudo flatpak override --filesystem=~/.fonts
sudo flatpak override --filesystem=~/.icons
