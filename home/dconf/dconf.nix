# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {

    "org/gnome/Weather" = {
      locations = "[<(uint32 2, <('Rio Novo do Sul', '', false, [(-0.36275258014867134, -0.71487881616298055)], [(-0.35459273218127879, -0.7042403531797119)])>)>]";
    };


    "org/gnome/desktop/interface" = {
      cursor-theme = "Adwaita";
      enable-animations = true;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      gtk-im-module = "gtk-im-context-simple";
      gtk-theme = "Materia-dark-compact";
      icon-theme = "Tela-dark";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      show-desktop = [ "<Super>d" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      action-middle-click-titlebar = "minimize";
      button-layout = "close,minimize,maximize:appmenu";
      focus-mode = "sloppy";
      resize-with-right-button = true;
    };

    "org/gnome/gedit/plugins" = {
      active-plugins = [ "spell" "sort" "modelines" "filebrowser" "docinfo" ];
    };

    "org/gnome/gedit/plugins/filebrowser" = {
      root = "file:///";
      tree-view = true;
      virtual-root = "file:///home/balllazo/.config/touchegg";
    };

    "org/gnome/gedit/preferences/editor" = {
      scheme = "cobalt";
      wrap-last-split-mode = "word";
    };

    "org/gnome/gedit/preferences/ui" = {
      show-tabs-mode = "auto";
    };

    "org/gnome/gnome-system-monitor" = {
      current-tab = "processes";
      maximized = false;
      network-total-in-bits = false;
      show-dependencies = false;
      show-whose-processes = "all";
      window-state = mkTuple [ 966 627 ];
    };

    "org/gnome/nautilus/list-view" = {
      use-tree-view = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      search-filter-time-type = "last_modified";
      search-view = "list-view";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 960 718 ];
      maximized = false;
      sidebar-width = 200;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "gnome-terminal";
      name = "Terminal";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Shift><Super>v";
      command = "com.github.hluk.copyq toggle";
      name = "Clipboard";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Primary><Shift>Escape";
      command = "gnome-system-monitor";
      name = "System Monitor";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      binding = "<Shift><Super>s";
      command = "flameshot gui";
      name = "Screenshot";
    };

    "org/gnome/shell" = {
      command-history = [ "r" ];
      disable-user-extensions = false;
      disabled-extensions = [ "extension-list@tu.berry" "shell-volume-mixer@derhofbauer.at" "ding@rastersoft.com" "just-perfection-desktop@just-perfection" ];
      enabled-extensions = [ "user-theme@gnome-shell-extensions.gcampax.github.com" "dash-to-dock@micxgx.gmail.com" "color-picker@tuberry" "sound-output-device-chooser@kgshank.net" "appindicatorsupport@rgcjonas.gmail.com" ];
      favorite-apps = [ "org.gnome.Nautilus.desktop" "org.gnome.tweaks.desktop" "org.gnome.Terminal.desktop" "code.desktop" "telegramdesktop.desktop" "brave-browser.desktop" "gnome-control-center.desktop" "brave-aeejceomnhmjmeacdckmmopfaigimnkl-Default.desktop" ];
      had-bluetooth-devices-setup = true;
      welcome-dialog-last-shown-version = "41.1";
    };

    "org/gnome/shell/extensions/color-picker" = {
      color-picker-shortcut = [ "<Shift><Super>c" ];
      enable-shortcut = true;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = false;
      background-opacity = 0.8;
      click-action = "minimize";
      custom-theme-shrink = false;
      dash-max-icon-size = 48;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      scroll-action = "cycle-windows";
    };

    "org/gnome/shell/extensions/shell-volume-mixer" = {
      position = "aggregateMenu";
      use-symbolic-icons = true;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Materia-light-compact";
    };

    "org/gnome/shell/extensions/x11gestures" = {
      swipe-fingers = 3;
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = "[<(uint32 2, <('Rio Novo do Sul', '', false, [(-0.36275258014867134, -0.71487881616298055)], [(-0.35459273218127879, -0.7042403531797119)])>)>]";
    };

    "org/gnome/software" = {
      check-timestamp = "int64 1638543481";
      download-updates = false;
      download-updates-notify = false;
    };

    "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      cursor-blink-mode = "on";
      cursor-shape = "ibeam";
      default-size-columns = 120;
      scrollbar-policy = "never";
      use-system-font = false;
      font = "FiraCode Nerd Font Mono 11";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

  };
}
