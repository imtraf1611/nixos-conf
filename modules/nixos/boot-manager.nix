{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  system = "x86_64-linux";
  grubTheme = inputs.honkai-railway-grub-theme.packages.${system}.castorice-grub-theme;
in {
  environment.etc = {};

  console.earlySetup = false;

  boot = {
    kernelParams = lib.mkBefore [
      "logo.nologo"
      "fbcon=nodefer"
      "bgrt_disable"
      "vt.global_cursor_default=0"
      "quiet"
      "systemd.show_status=false"
      "loglevel=3"
      "udev.log_level=3"
      "udev.log_priority=3"
      "rd.udev.log_level=3"
      "splash"
    ];

    consoleLogLevel = 3;

    initrd = {
      verbose = false;
      systemd.enable = true;
    };

    loader = {
      grub = {
        enable = true;
        device = "nodev"; # EFI mode
        efiSupport = true;
        useOSProber = true;

        theme = grubTheme;
        splashImage = "${grubTheme}/background.png";
      };

      efi.canTouchEfiVariables = true;
    };
  };
}
