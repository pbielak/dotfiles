# Networking
{ config, pkgs, ... }:

{
  # Hostname
  networking.hostName = "nixos";

  # Wireless
  # networking.wireless.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
