{
  config,
  lib,
  pkgs,
  ...
}:
{
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
<<<<<<< HEAD
=======
    ../../nixos/gnome.nix
>>>>>>> d0db58d (add assets)
    ../../nixos/sound.nix

    ./hardware-configuration.nix
    ./services.nix
    ./variables.nix
  ];

  nix.settings = {
    download-buffer-size = 134217728;
  };

  nix.package = pkgs.nixVersions.latest;

<<<<<<< HEAD
  services.gvfs.enable = true;

  home-manager.users."${config.var.username}" = import ./home.nix;

  # OpenGL
  hardware.graphics = {
    enable = true;
  };

=======
  home-manager.users."${config.var.username}" = import ./home.nix;

>>>>>>> d0db58d (add assets)
  system.stateVersion = "25.05";
}
