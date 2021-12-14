{ config, pkgs, lib, ... }:

{
  imports = [
    ./home/zsh/zsh.nix
    #./home/dconf/dconf.nix # COMMENT AFTER FIRST RUN/INSTALL
  ];
  home.username = "balllazo";
  home.homeDirectory = "/home/balllazo";
  home.stateVersion = "21.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  ### HOME PACKAGES ###
  home.packages = with pkgs; [
    gh
    yarn
    nixpkgs-fmt
    shellcheck
    flameshot
    tela-icon-theme
    materia-theme
    gnomeExtensions.color-picker
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.sound-output-device-chooser
    gnomeExtensions.just-perfection
    gnomeExtensions.extension-list
    gnomeExtensions.x11-gestures
    gnome.gnome-tweaks
    gnome.dconf-editor
  ];

  ### PROGRAMS ###
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscode;
    };
    git = {
      enable = true;
      userName = "Adson Cicilioti";
      userEmail = "eu@adsonagencia.com";
      extraConfig = { pull = { rebase = false; }; };
    };

  };
  nixpkgs.config.allowUnfree = true;
}
