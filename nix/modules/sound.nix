# Sound
{ config, pkgs, ... }:

{
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    extraModules = [ ];
    package = pkgs.pulseaudioFull;
  };

  # Explicit PulseAudio support
  nixpkgs.config.pulseaudio = true;

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings = {
      General = {
        ControllerMode = "bredr";
      };
    };
  };
}
