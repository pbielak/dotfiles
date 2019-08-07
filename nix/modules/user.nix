# User account
{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.peter = {
    isNormalUser = true;
    home = "/home/peter";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "docker" "audio" ];
  };
}
