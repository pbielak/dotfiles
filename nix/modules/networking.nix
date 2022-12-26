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
  environment.systemPackages = [ pkgs.wireguard-tools ];

  # Fix for wpa_supplicant
  nixpkgs.overlays = [
    (self: super: {
      wpa_supplicant = super.wpa_supplicant.overrideAttrs (oldAttrs: rec {
        extraConfig = oldAttrs.extraConfig + ''
          CONFIG_WEP=y
        '';
      });
    })
  ];
}
