# Networking
{ config, pkgs, ... }:

{
  # Hostname
  networking.hostName = "nixos";

  # Wireless
  networking.wireless.enable = true;
  networking.wireless.interfaces = ["wlp3s0"];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  # Wireguard
  environment.systemPackages = [ pkgs.wireguard pkgs.wireguard-tools ];
}
