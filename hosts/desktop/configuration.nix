{
  config,
  lib,
  pkgs,
  ...
}:
{
  nixpkgs.overlays = [
    (import ../../overlays/material-symbols.nix)
  ];

  imports = [
    # System configurations
    ../../nixos/boot-manager.nix
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/nix.nix
    ../../nixos/nix-ld.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/hyprland.nix
    ../../nixos/kde-plasma.nix
    ../../nixos/sound.nix

    ./hardware-configuration.nix

    ./variables.nix
  ];

  nix.settings = {
    download-buffer-size = 134217728;
  };

  # Nix PM Version
  nix.package = pkgs.nixVersions.latest;

  # Setup Home Manager for our user
  home-manager.users."${config.var.username}" = import ./home.nix;

  # OpenGL
  hardware.graphics = {
    enable = true;
  };

  # NixOS Version - Don't Change
  system.stateVersion = "25.05";
}
