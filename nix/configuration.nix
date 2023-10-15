# NixOS config
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/bootloader.nix
      ./modules/misc.nix
      ./modules/networking.nix
      ./modules/pkgs.nix
      ./modules/sound.nix
      ./modules/user.nix
      ./modules/xserver.nix
      ./modules/zsh.nix

#      ./modules/master-pkgs.nix
    ];

  system.stateVersion = "19.03";

}
