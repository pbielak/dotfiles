# ZSH
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "docker" "git" "tmux" "virtualenv" "fancy-ctrl-z" ];
      theme = "eastwood";
    };
    syntaxHighlighting.enable = true;
  };
}
