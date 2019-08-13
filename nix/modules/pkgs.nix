# Packages (software)
{ config, pkgs, ... }:

{
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

    # Terminal
    htop
    git
    terminator
    wget
    vim
    tmux

    # ZSH
    zsh
    oh-my-zsh

    # Other
    docker
    xflux
    xflux-gui
    pciutils
    networkmanager
    awscli
    zip
    unzip
    lm_sensors

    # Window manager
    i3
    xorg.xinit
    xorg.xev
    xorg.setxkbmap
    acpilight
    feh
    dunst
    libnotify
  ];

  virtualisation.docker.enable = true;
}
