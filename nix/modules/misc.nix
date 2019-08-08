# Misc config
{ config, pkgs, ... }:

{
  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };
  i18n = {
    consoleUseXkbConfig = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Backlight
  hardware.brightnessctl.enable = true;
}
