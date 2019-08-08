# XServer
{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;
    autorun = false;

    desktopManager = {
      default = "none";
      xterm.enable = false;
    };

    displayManager.startx.enable = true;

    exportConfiguration = true;

    # Enable touchpad support.
    libinput = {
      enable = true;
      naturalScrolling = true;
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3;
      extraPackages = with pkgs; [
        i3status
        i3lock
        i3blocks
        rofi
        scrot
        imagemagick
      ];
    };
  };
}
