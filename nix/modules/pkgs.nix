# Packages (software)
{ config, pkgs, ... }:

{
  # List packages installed in system profile.
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Dev
    python37Full
    python38Full
    python310
    rustup
    gcc
    jetbrains.pycharm-professional

    # IM
    discord
    slack
    zoom-us
    
    # Music
    spotify

    # Web
    (vivaldi.override {
      proprietaryCodecs = true;
      vivaldi-ffmpeg-codecs = vivaldi-ffmpeg-codecs;
      enableWidevine = true;
      vivaldi-widevine = vivaldi-widevine;
    })
    vivaldi-ffmpeg-codecs
    thunderbird

    # Terminal
    htop
    git
    terminator
    wget
    vim
    tmux
    ncdu

    # ZSH
    zsh
    oh-my-zsh

    # Other
    docker
    xflux
    pciutils
    awscli
    zip
    unzip
    lm_sensors
    s-tui
    pavucontrol
    bat  # cat (1) replacement
    exa  # ls replacement
    binutils-unwrapped # Tools like "ar"

    # Network
    networkmanager
    networkmanagerapplet
    networkmanager-openvpn

    # Window manager
    i3
    xorg.xinit
    xorg.xev
    xorg.setxkbmap
    acpilight
    feh
    dunst
    libnotify
    # blueman  # Bluetooth

    bitwarden

    # Steam
    steam

    # GCloud
    google-cloud-sdk

    # Brightness adjustment
    brightnessctl
  ];

  virtualisation.docker = {
    enable = true;
    extraOptions = "--experimental -s overlay";
  };

  # virtualisation.virtualbox = {
  #   host.enable = true;
  # };
}
