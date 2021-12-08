{ config, pkgs, lib, ... }: {
  imports = [ /etc/nixos/hardware-configuration.nix ];

  hardware.cpu.intel.updateMicrocode = true;

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ libva libvdpau-va-gl ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ libva libvdpau-va-gl ];
    };
  };

  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.prime = {
    sync.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  ### BOOT ###
  boot = {
    kernelModules = [ "hid-apple" ];
    kernelParams = [
      "intel_iommu=on"
      "hid_apple.fnmode=2"
      "quiet"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    initrd.verbose = false;
    consoleLogLevel = 0;
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
    };
    # plymouth = { enable = true; }; # Problem double login with GDM when ZSH as default shell
  };

  ### FILESYSTEMS ###
  fileSystems."/" = {
    options = [ "noatime" "compress=zstd" "space_cache" "discard=async" "subvol=@" ];
  };
  fileSystems."/home" = {
    options = [ "noatime" "compress=zstd" "space_cache=v2" "discard=async" "subvol=@home" ];
  };
  fileSystems."/mnt/Storage" = {
    device = "/dev/disk/by-label/Storage";
    fsType = "ntfs3";
    options = [
      "nosuid"
      "nodev"
      "nofail"
      "x-gvfs-show"
      "auto"
      "rw"
      "uid=1000"
      "gid=100"
    ];
  };

  ### VIRTUALIZATION ###
  virtualisation = { podman = { enable = true; }; };

  ### NETWORK ###
  networking.hostName = "nixell"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  networking = {
    useDHCP = false;
    interfaces = {
      enp4s0.useDHCP = true;
      wlo1.useDHCP = true;
    };
    networkmanager.enable = true;
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  ### BLUETOOTH ###
  hardware.bluetooth = { enable = true; };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  ### XORG ###
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = lib.mkForce [ "nvidia" ];
    displayManager = {

      gdm.enable = true;
      hiddenUsers = lib.mkForce [ ];
      sessionCommands = ''
        ${pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 1 0
        ${pkgs.xorg.xrandr}/bin/xrandr --auto
        modprobe -r hid_apple && modprobe hid_apple
      '';
    };
    desktopManager.gnome.enable = true;

    screenSection = ''
      Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
      Option         "AllowIndirectGLXProtocol" "off"
      Option         "TripleBuffer" "on"
    '';
    serverLayoutSection = ''
      Option "AllowNVIDIAGPUScreens"
    '';
    exportConfiguration = true;

    # Configure keymap in X11
    layout = "us,br";
    xkbVariant = "altgr-intl,abnt2";
  };

  # Account Daemon
  services.accounts-daemon.enable = true;

  # TOUCHEGG
  services.touchegg.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  fonts = {
    fonts = with pkgs;
      [ (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; }) ];
    fontDir.enable = true;
    enableDefaultFonts = true;
  };

  ### SOUND ###
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  # hardware.pulseaudio.support32Bit = true;

  # Pipewire
  services.pipewire = {
    enable = true;
    pulse = { enable = true; };
    alsa = {
      enable = true;
      support32Bit = true;
    };
    # jack = { enable = true; };
    media-session = { enable = true; };
  };

  ### USER ###
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.balllazo = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "networkmanager"
      "sys"
      "log"
      "rfkill"
      "video"
    ];
  };

  # services.logind.killUserProcesses = true;

  # KEYRING - Fix vscode sync
  services.gnome.gnome-keyring.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  ### NIX ###
  nix = {
    optimise.automatic = true;
    autoOptimiseStore = true;
    gc.automatic = true;
  };

  ### SYSTEM PACKAGES ###
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.binsh = "${pkgs.bash}/bin/bash";zsh emulate
  environment.systemPackages = with pkgs; [
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    wget
    p7zip
    unzip
    neofetch
    htop
    curl
    brave
    firefox
    chrome-gnome-shell
    gimp
    inkscape
    krita
    blender
    mpv
    git
    sassc
    pkg-config
    binutils
    coreutils
    pciutils
    compsize
    vulkan-tools
    lm_sensors
    openal
    ffmpeg
    gnupg
    gtk-engine-murrine
    gdk-pixbuf
    librsvg
  ];

  # EXCLUDE GNOME APPS
  environment.gnome.excludePackages = [
    pkgs.epiphany
  ];

  # FLATPAK
  services.flatpak.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # ENABLE FOR NON GNOME DESKTOP

  programs = {
    zsh.enable = true;
    dconf.enable = true;
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
    # gnome-terminal.enable = true;
  };

  nixpkgs = {
    config = { allowUnfree = true; };

    ## OVERLAYS ##
    overlays = [
      (final: prev: {
        blender = prev.blender.override { cudaSupport = true; };
      })
    ];
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  system.stateVersion = "21.11"; # Did you read the comment?

}

