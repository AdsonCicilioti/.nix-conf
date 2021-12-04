{ config, pkgs, lib, ... }:

{
  imports = [
    ./home/zsh/zsh.nix
    ./home/dconf/dconf.nix
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "balllazo";
  home.homeDirectory = "/home/balllazo";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  ### HOME PACKAGES ###
  home.packages = with pkgs; [
    gh
    nixpkgs-fmt
    shellcheck
    tela-icon-theme
    whitesur-gtk-theme
    whitesur-icon-theme
    gnomeExtensions.color-picker
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.sound-output-device-chooser
    gnomeExtensions.just-perfection
    gnomeExtensions.extension-list
    # gnomeExtensions.x11-gestures
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
