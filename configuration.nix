# Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

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
    kernelModules = [ "nvidia" "nvidia-modeset" "nvidia-uvm" "nvidia-drm" ];
    kernelParams = [ "intel_iommu=on" "nvidia-drm.modeset=1" ];
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
    kernelPackages = pkgs.linuxPackages_5_15;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    extraModprobeConfig = ''
      options hid_apple fnmode=0
    '';
  };

  virtualisation = { podman = { enable = true; }; };

  ### NETWORK ###
  networking.hostName = "nixell"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking = {
    useDHCP = false;
    interfaces = {
      enp4s0.useDHCP = true;
      wlo1.useDHCP = true;
    };
    networkmanager.enable = true;
  };

  ### BLUETOOTH ###
  hardware.bluetooth = { enable = true; };
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";
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
      # sddm.enable = true;
      #lightdm.enable = false;
      gdm.enable = true;
      hiddenUsers = lib.mkForce [ ];
      sessionCommands = ''
        ${pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 1 0
        ${pkgs.xorg.xrandr}/bin/xrandr --auto
      '';
      #defaultSession = "pantheon";
    };
    #desktopManager.plasma5.enable = true;
    desktopManager.gnome.enable = true;
    #desktopManager.pantheon.enable = true;
    
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

  services.accounts-daemon.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  ### SYSTEM PACKAGES ###
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    wget
    p7zip
    unzip
    neofetch
    htop
    curl
    firefox
    brave
    gimp
    inkscape
    krita
    blender
    tdesktop
    mpv
    cmake
    gnumake
    gcc
    pkg-config
    binutils
    coreutils
    pciutils
    meson
    vulkan-tools
    lm_sensors
    openal
    ffmpeg
    cudatoolkit
    gnupg

  ];

  programs = { dconf.enable = true; };

  nixpkgs.config = {
    allowUnfree = true;
    blender = { cudaSupport = true; };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

