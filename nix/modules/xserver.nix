# XServer
{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  # services.xserver.enable = true;
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
}
