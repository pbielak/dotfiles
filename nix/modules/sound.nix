# Sound
{ config, pkgs, ... }:

{
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Explicit PulseAudio support
  nixpkgs.config.pulseaudio = true;
}
