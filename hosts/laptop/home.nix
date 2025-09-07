{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    # User Specific Config
    ./variables.nix

    # System modules
    ../../home/system/hyprland
    ../../home/system/hypridle
    ../../home/system/hyprlock
    ../../home/system/cursor
    ../../home/system/bash
    ../../home/system/fish-shell
    ../../home/system/oh-my-posh
    ../../home/system/git
    ../../home/system/fastfetch
    ../../home/system/bat
    ../../home/system/caelestia-shell
    # ../../home/system/yazi
    ../../home/system/gtk

    # Program modules
    ../../home/programs/discord
    ../../home/programs/ghostty
    ../../home/programs/zen-browser
    ../../home/programs/zed
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/${config.var.username}";
    stateVersion = "25.05"; # Don't touch this

    packages = with pkgs; [
      # Applications
      youtube-music
      discord

      # Development - Languages & Runtimes & Tools
      nodejs_22
      bun
      yarn
      pnpm
      python3
      biome

      # Development - Editors
      vscode
      zed-editor

      # System utilities
      grc
      zip
      unzip
      tree
      btop
      superfile
      git-credential-manager

      # Shell & presentation
      fish
      oh-my-posh
      fastfetch
      bat

      # GUI libraries
      libgtkflow4
      gtk4

      # Media & hardware
      cava
      bluez
      ddcutil
      brightnessctl
      imagemagick

      # Formatting tools
      nixfmt-rfc-style
    ];

    sessionVariables = {
      # Prisma configuration
      PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
      PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
      PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";

      # Nix-ld configuration
      LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/background" = {
        picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  # Enable Home Manager (can be omitted - enabled by default)
  programs.home-manager.enable = true;
}
