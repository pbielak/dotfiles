# XServer
{ config, pkgs, ... }:

{
  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;
    autorun = false;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager.defaultSession = "none+i3";
    displayManager.startx.enable = true;

    exportConfiguration = true;

    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
      };
    };

    xkbOptions = "ctrl:nocaps";
    layout = "pl";

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

  programs.dconf.enable = true;
  services.dbus.packages = with pkgs; [
    dconf
  ];
}
