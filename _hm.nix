{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/master.tar.gz";

in {
  imports = [ (import "${home-manager}/nixos") ];
  home-manager = {
    users = {
      balllazo = {
        home.packages = with pkgs; [
          brave
          blender
          gimp
          inkscape
          krita
          gh
          vscode
          nixfmt
        ];
        programs.git = {
          enable = true;
          userName = "Adson Cicilioti";
          userEmail = "eu@adsonagencia.com";
          extraConfig = { pull = { rebase = false; }; };
        };
      };
    };
  };
}
