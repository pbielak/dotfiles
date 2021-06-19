# Workaround for downloading pakages from master
{ config, pkgs, ... }:

let
  baseConfig = {
    allowUnfree = true;
  };

  pkgsMaster = import (
    fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/eb7ecd3b6f43d5402fba6abc736ad9a86347ae05.tar.gz;  # Master pinned
      sha256 = "0cl440vh45qfg01rz5x1d79pd5anwbczd39pn4034s66q3dbmvr3";
    }
  ) { config = baseConfig; };

  pkgsMaster2 = import (
    fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/04f9cd0b0c118367a0c0ac54301402c7b9985732.tar.gz; # Pinned 2
    }
  ) { config = baseConfig; };

  pkgsMasterTop = import (
    fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/master.tar.gz; # Always top of master branch
    }
  ) { config = baseConfig; };
in
{
  nixpkgs.config = baseConfig // {
    packageOverrides = pkgs: {
      dunst = pkgsMaster.dunst;
      hplip = (pkgsMaster.hplip.override {
        withPlugin = true;
      });
      vivaldi = pkgsMaster.vivaldi;
      vivaldi-ffmpeg-codecs = pkgsMaster.vivaldi-ffmpeg-codecs;
      vivaldi-widevine = pkgsMaster.vivaldi-widevine;
      # freeoffice = pkgsMaster.freeoffice;
      networkmanager = pkgsMaster.networkmanager;
      networkmanagerapplet = pkgsMaster.networkmanagerapplet;
      networkmanager-openvpn = pkgsMaster.networkmanager-openvpn;
      slack = pkgsMaster.slack;
      # steam = pkgsMaster2.steam;
      steam = (pkgsMaster2.steam.override { 
        extraLibraries = pkgs: [ pkgsMaster2.pipewire ]; 
      });
      bitwarden = pkgsMaster2.bitwarden;

      discord = pkgsMasterTop.discord;
      google-cloud-sdk = pkgsMasterTop.google-cloud-sdk;
      zoom-us = pkgsMasterTop.zoom-us;
      # teams = pkgsMasterTop.teams;
    };
  };
}
