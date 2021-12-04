# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "ca/desrt/dconf-editor" = {
      saved-pathbar-path = "/org/gnome/shell/extensions/just-perfection/gesture";
      saved-view = "/org/gnome/shell/";
      window-height = 666;
      window-is-maximized = false;
      window-width = 960;
    };

    "org/gnome/Connections" = {
      first-run = false;
    };

    "org/gnome/Weather" = {
      locations = "[<(uint32 2, <('Rio Novo do Sul', '', false, [(-0.36275258014867134, -0.71487881616298055)], [(-0.35459273218127879, -0.7042403531797119)])>)>]";
    };

    "org/gnome/calculator" = {
      accuracy = 9;
      angle-units = "degrees";
      base = 10;
      button-mode = "basic";
      number-format = "automatic";
      show-thousands = false;
      show-zeroes = false;
      source-currency = "";
      source-units = "degree";
      target-currency = "";
      target-units = "radian";
      window-position = mkTuple [ 279 52 ];
      word-size = 64;
    };

    "org/gnome/control-center" = {
      last-panel = "background";
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" ];
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///nix/store/xvm2y1g3mzs6mrjjlgsq578vj48d8946-gnome-backgrounds-41.0/share/backgrounds/gnome/adwaita-timed.xml";
      primary-color = "#3465a4";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/input-sources" = {
      per-window = false;
      sources = [ (mkTuple [ "xkb" "us+altgr-intl" ]) (mkTuple [ "xkb" "br+abnt2" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      cursor-theme = "Adwaita";
      enable-animations = true;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      gtk-im-module = "gtk-im-context-simple";
      gtk-theme = "WhiteSur-dark-solid-alt";
      icon-theme = "WhiteSur-dark";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "telegramdesktop" "org-gnome-nautilus" "gnome-power-panel" "firefox" "org-gnome-terminal" "brave-browser" "nz-mega-megasync" "brave-aeejceomnhmjmeacdckmmopfaigimnkl-default" "com-github-hluk-copyq" ];
    };

    "org/gnome/desktop/notifications/application/brave-aeejceomnhmjmeacdckmmopfaigimnkl-default" = {
      application-id = "brave-aeejceomnhmjmeacdckmmopfaigimnkl-Default.desktop";
    };

    "org/gnome/desktop/notifications/application/brave-browser" = {
      application-id = "brave-browser.desktop";
    };

    "org/gnome/desktop/notifications/application/com-github-hluk-copyq" = {
      application-id = "com.github.hluk.copyq.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/nz-mega-megasync" = {
      application-id = "nz.mega.MEGAsync.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-shell-extensions" = {
      application-id = "org.gnome.Shell.Extensions.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-terminal" = {
      application-id = "org.gnome.Terminal.desktop";
    };

    "org/gnome/desktop/notifications/application/telegramdesktop" = {
      application-id = "telegramdesktop.desktop";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      disable-microphone = false;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///nix/store/xvm2y1g3mzs6mrjjlgsq578vj48d8946-gnome-backgrounds-41.0/share/backgrounds/gnome/adwaita-timed.xml";
      primary-color = "#3465a4";
      secondary-color = "#000000";
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

    "org/gnome/evolution-data-server" = {
      migrated = true;
      network-monitor-gio-name = "";
    };

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 250;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/file-roller/ui" = {
      sidebar-width = 200;
      window-height = 480;
      window-width = 600;
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

    "org/gnome/gedit/state/window" = {
      bottom-panel-size = 140;
      side-panel-active-page = "GeditWindowDocumentsPanel";
      side-panel-size = 200;
      size = mkTuple [ 900 700 ];
      state = 87168;
    };

    "org/gnome/gnome-system-monitor" = {
      current-tab = "processes";
      maximized = false;
      network-total-in-bits = false;
      show-dependencies = false;
      show-whose-processes = "all";
      window-state = mkTuple [ 966 627 ];
    };

    "org/gnome/gnome-system-monitor/disktreenew" = {
      col-6-visible = true;
      col-6-width = 0;
    };

    "org/gnome/gnome-system-monitor/proctree" = {
      columns-order = [ 0 1 2 3 4 6 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 ];
      sort-col = 15;
      sort-order = 0;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = true;
      dynamic-workspaces = true;
      edge-tiling = true;
      focus-change-on-pointer-rest = true;
      workspaces-only-on-primary = true;
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

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 12.0;
      night-light-schedule-to = 12.0;
      night-light-temperature = "uint32 4036";
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
      command = "org.flameshot.Flameshot gui";
      name = "Screenshot";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
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
      notify-style = "uint32 1";
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

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = true;
      activities-button = false;
      aggregate-menu = true;
      app-menu = true;
      app-menu-icon = true;
      background-menu = true;
      clock-menu-position = 0;
      clock-menu-position-offset = 9;
      dash = true;
      dash-icon-size = 0;
      double-super-to-appgrid = true;
      gesture = true;
      hot-corner = false;
      keyboard-layout = true;
      osd = true;
      panel = true;
      panel-arrow = true;
      panel-corner-size = 0;
      panel-in-overview = true;
      panel-notification-icon = true;
      panel-size = 0;
      ripple-box = true;
      search = true;
      show-apps-button = true;
      startup-status = 0;
      theme = false;
      top-panel-position = 0;
      window-demands-attention-focus = true;
      window-picker-icon = true;
      window-preview-caption = true;
      workspace = true;
      workspace-background-corner-size = 0;
      workspace-popup = true;
      workspace-wrap-around = false;
      workspaces-in-app-grid = true;
    };

    "org/gnome/shell/extensions/shell-volume-mixer" = {
      position = "aggregateMenu";
      use-symbolic-icons = true;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "WhiteSur-dark-alt";
    };

    "org/gnome/shell/extensions/x11gestures" = {
      swipe-fingers = 3;
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = "[<(uint32 2, <('Rio Novo do Sul', '', false, [(-0.36275258014867134, -0.71487881616298055)], [(-0.35459273218127879, -0.7042403531797119)])>)>]";
    };

    "org/gnome/shell/world-clocks" = {
      locations = "@av []";
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
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 148;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 2265 85 ];
      window-size = mkTuple [ 1231 902 ];
    };

  };
}
