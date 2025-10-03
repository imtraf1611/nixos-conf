{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./variables.nix
    ./services.nix

    ../../modules/nixos/boot-manager.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/home-manager.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/nix-ld.nix
    ../../modules/nixos/utils.nix
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/gnome.nix
    ../../modules/nixos/sound.nix
  ];

  users.users = {
    imtraf = {
      isNormalUser = true;
      description = "Imtraf";
      extraGroups = ["networkmanager" "wheel"];
    };

    underdel = {
      isNormalUser = true;
      description = "Underdel";
      extraGroups = ["networkmanager"];
      initialHashedPassword = "$6$qw1tp4FBuOQTH7gz$hC7C6Lhj020Ab7q/T7AaN0/cxBiskgH0O/AFA5.h0.IloDORAIzS6Ldfm6wLF22m0mLbBQJWpOzL1VMF9gcgm.";
    };
  };

  security.sudo.extraRules = [
    {
      users = ["imtraf"];
      commands = [
        {
          command = "/run/current-system/sw/bin/nixos-rebuild";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];

  nix.settings = {
    download-buffer-size = 134217728;
  };

  nix.package = pkgs.nixVersions.latest;

  services.gvfs.enable = true;

  home-manager.users = {
    imtraf = import ../../home/imtraf/home.nix;
    underdel = import ../../home/underdel/home.nix;
  };

  system.stateVersion = "25.05";
}
