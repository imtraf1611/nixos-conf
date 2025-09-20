{
  description = ''
    Personal dotfiles for using Hyprland with QuickShell on NixOS.
    Intended to be modular for easy customizability.
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord.url = "github:kaylorben/nixcord";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    honkai-railway-grub-theme.url = "github:voidlhf/StarRailGrubThemes";
  };

  outputs = inputs @ {
    nixpkgs,
    quickshell,
    ...
  }: let
    system = "x86_64-linux";

    # Common module configuration
    commonModules = [
      {
        nixpkgs.overlays = [];
        _module.args = {inherit inputs;};
      }
      inputs.home-manager.nixosModules.home-manager
    ];

    # Helper function to create system configurations
    mkSystem = hostPath: extraPackages:
      nixpkgs.lib.nixosSystem {
        inherit system;

        modules =
          commonModules
          ++ [
            {
              environment.systemPackages = extraPackages;
            }
            hostPath
          ];
      };
  in {
    nixosConfigurations = {
      desktop = mkSystem ./hosts/desktop/configuration.nix [
        quickshell.packages.${system}.default
      ];
      laptop = mkSystem ./hosts/laptop/configuration.nix [
        quickshell.packages.${system}.default
      ];
    };
  };
}
