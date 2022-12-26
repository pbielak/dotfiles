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

  pkgsMasterTop = import (
    fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/master.tar.gz; # Always top of master branch
    }
  ) { config = baseConfig; };
in
{
  nixpkgs.config = baseConfig // {
    packageOverrides = pkgs: {
      hplip = (pkgsMaster.hplip.override {
        withPlugin = true;
      });
      networkmanager = pkgsMaster.networkmanager;
      networkmanagerapplet = pkgsMaster.networkmanagerapplet;
      networkmanager-openvpn = pkgsMaster.networkmanager-openvpn;
      slack = pkgsMasterTop.slack;
      steam = pkgsMasterTop.steam;
      # pycharm-professional = pkgsMasterTop.jetbrains.pycharm-professional;
      discord = pkgsMasterTop.discord;
      google-cloud-sdk = pkgsMasterTop.google-cloud-sdk;
      zoom-us = pkgsMasterTop.zoom-us;
    };
  };
}
