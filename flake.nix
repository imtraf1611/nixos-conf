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
  };

  outputs =
    inputs@{
      nixpkgs,
      quickshell,
      ...
    }:
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            {
              nixpkgs.overlays = [ ];
              _module.args = { inherit inputs; };
            }

            {
              environment.systemPackages = [

              ];
            }

            inputs.home-manager.nixosModules.home-manager
            ./hosts/desktop/configuration.nix
          ];
        };

        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            {
              nixpkgs.overlays = [ ];
              _module.args = { inherit inputs; };
            }

            {
              environment.systemPackages = [
                quickshell.packages.x86_64-linux.default
              ];
            }

            inputs.home-manager.nixosModules.home-manager
            ./hosts/laptop/configuration.nix
          ];
        };
      };
    };
}
