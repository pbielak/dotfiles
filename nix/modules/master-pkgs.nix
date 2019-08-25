# Workaround for downloading pakages from master
{ config, pkgs, ... }:

let
  baseConfig = {
    allowUnfree = true;
  };

  pkgsMaster = import (
    fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/18dfe1a3f5114872e00a019e2a339286ed649f82.tar.gz;  # Master pinned
      sha256 = "1xkdsmili2nyy36v51rf21d0xi75cvqyiakv6ijvln2x217i1n52";
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
    };
  };
}
