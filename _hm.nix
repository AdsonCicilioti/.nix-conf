{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/master.tar.gz";

in {
  imports = [ (import "${home-manager}/nixos") ];
  home-manager = {
    useGlobalPkgs = true;
    users = {
      balllazo = {
        home.packages = with pkgs; [
          brave
          blender
          gimp
          inkscape
          krita
          gh
          nixfmt
        ];
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
      };
    };
  };
}
