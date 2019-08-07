# NixOS config
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Use the GRUB2 boot loader (with EFI support).
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.enableCryptodisk = true;
  boot.loader.grub.efiInstallAsRemovable = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # List packages installed in system profile.
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Dev
    python37Full
    rustup
    gcc
    jetbrains.pycharm-professional

    # IM
    discord
    tdesktop
    slack
    
    # Music
    spotify

    # Web
    vivaldi
    thunderbird

    # Other
    docker
    htop
    git
    terminator
    wget
    vim
    tmux
    xflux
    xflux-gui
    zsh
    oh-my-zsh

    # Window manager
    i3
    xorg.xinit
    feh
  ];

  virtualisation.docker.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.peter = {
    isNormalUser = true;
    home = "/home/peter";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "docker" "git" "tmux" "virtualenv" "fancy-ctrl-z" ];
      theme = "eastwood";
    };
    syntaxHighlighting.enable = true;
  };

  environment.pathsToLink = [ "/libexec" ];
  environment.variables = {
    OH_MY_ZSH = [ "${pkgs.oh-my-zsh}/share/oh-my-zsh" ];
  };

  services.xserver = {
    enable = true;
    autorun = false;

    desktopManager = {
      default = "none";
      xterm.enable = false;
    };

    displayManager.startx.enable = true;

    exportConfiguration = true;

    libinput.enable = true;

    resolutions = [
      { x = 1440; y = 900; }
    ];

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
        rofi
      ];
    };
  };

  system.stateVersion = "19.03";

}
