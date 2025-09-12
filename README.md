# My NixOS Configuration

This repository contains my personal NixOS configuration files. It's designed to be modular and easily customizable, with a focus on the [Hyprland](https://hyprland.org/) window manager.

## Directory Structure

This configuration is organized into the following directories:

*   `assets`: Contains static assets like wallpapers and avatars.
*   `hosts`: Contains host-specific configurations. Each host has its own subdirectory (e.g., `laptop`, `desktop`).
*   `modules`: Contains NixOS and Home Manager modules that are shared across different hosts.
    *   `nixos`: Contains system-level NixOS modules.
    *   `home-manager`: Contains user-level Home Manager modules.
*   `overlays`: Contains Nixpkgs overlays for customizing packages.

## Hosts

The following hosts are configured:

*   **desktop**: My desktop machine.
*   **laptop**: My laptop.

## Key Technologies

This configuration uses the following technologies:

*   [NixOS](https://nixos.org/): The operating system.
*   [Home Manager](https://github.com/nix-community/home-manager): For managing user-specific dotfiles and packages.
*   [Hyprland](https://hyprland.org/): A dynamic tiling Wayland compositor.
*   [QuickShell](https://git.outfoxxed.me/outfoxxed/quickshell): A custom shell environment.

## How to Use

To use this configuration, you need to have NixOS installed with flakes enabled. Then, you can build the configuration for a specific host using the following command:

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

For example, to build the configuration for the `laptop` host, you would run:

```bash
sudo nixos-rebuild switch --flake .#laptop
```

## Hardware Configuration

The `hardware-configuration.nix` file is specific to each machine. The one in this repository is for my personal setup. When you use this configuration on a new machine, you will need to generate a new `hardware-configuration.nix` file.

After a standard NixOS installation, you can find the generated `hardware-configuration.nix` file in `/etc/nixos/hardware-configuration.nix`. You should copy this file to the appropriate host directory in this repository, for example:

```bash
cp /etc/nixos/hardware-configuration.nix hosts/<your-hostname>/
```

It is recommended to add `**/*hardware-configuration.nix` to your `.gitignore` file to avoid accidentally committing your machine-specific hardware configuration.

---
