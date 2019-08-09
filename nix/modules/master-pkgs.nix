# Workaround for downloading pakages from master
{ config, pkgs, ... }:

let
  baseConfig = {
    allowUnfree = true;
  };

  pkgsMaster = import (
    fetchTarball https://github.com/NixOS/nixpkgs/archive/master.tar.gz
  ) { config = baseConfig; };
in
{
  nixpkgs.config = baseConfig // {
    packageOverrides = pkgs: {
      vivaldi = pkgsMaster.vivaldi;
    };
  };
}
