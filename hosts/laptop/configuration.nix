{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    # System configurations
    ../../modules/nixos/boot-manager.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/home-manager.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/nix-ld.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/utils.nix
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/gnome.nix
    ../../modules/nixos/gnome.nix
    ../../modules/nixos/sound.nix

    ./hardware-configuration.nix
    ./services.nix
    ./variables.nix
  ];

  nix.settings = {
    download-buffer-size = 134217728;
  };

  nix.package = pkgs.nixVersions.latest;

  services.gvfs.enable = true;

  home-manager.users."${config.var.username}" = import ./home.nix;

  system.stateVersion = "25.05";
}
