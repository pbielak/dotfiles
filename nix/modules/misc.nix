# Misc config
{ config, pkgs, ... }:

{
  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };
  console.useXkbConfig = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [
      pkgs.gutenprint
      #pkgs.hplip
      pkgs.hplipWithPlugin
    ];
  };

  # Fonts
  fonts.fonts = with pkgs; [
    noto-fonts
    font-awesome_5
  ];

  # Power management
  services.tlp.enable = true;
  services.tlp.settings = {
    DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";
    START_CHARGE_THRESH_BAT0 = 85;
    STOP_CHARGE_THRESH_BAT0 = 90;
    START_CHARGE_THRESH_BAT1 = 85;
    STOP_CHARGE_THRESH_BAT1 = 90;
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    ENERGY_PERF_POLICY_ON_BAT = "powersave";
  };

  # Steam specific
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  hardware.pulseaudio.support32Bit = true;
}
