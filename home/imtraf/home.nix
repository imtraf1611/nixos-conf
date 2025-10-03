{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./variables.nix

    ../../modules/home/apps/zen-browser
    ../../modules/home/apps/zed
    ../../modules/home/apps/obs-studio
    ../../modules/home/apps/discord

    ../../modules/home/cli/fastfetch
    ../../modules/home/cli/git
    ../../modules/home/cli/yazi

    ../../modules/home/shells/bash
    ../../modules/home/shells/bat
    ../../modules/home/shells/fish-shell
    ../../modules/home/shells/oh-my-posh

    ../../modules/home/system/caelestia-shell
    ../../modules/home/system/cursor
    ../../modules/home/system/gtk
    ../../modules/home/system/hyprland

    ../../modules/home/terminals/ghostty
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/${config.var.username}";
    stateVersion = "25.05"; # Don't touch this

    packages = with pkgs; [
      # Applications
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
      git
      git-credential-manager

      # Shell & presentation
      fish
      oh-my-posh
      fastfetch
      bat
      yazi

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
      alejandra
    ];

    sessionVariables = {
      # Prisma configuration
      PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
      PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
      PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
      PRISMA_FMT_BINARY = "${pkgs.prisma-engines}/bin/prisma-fmt";
      PATH = "$PWD/node_modules/.bin/:$PATH";

      # Nix-ld configuration
      LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  # Enable Home Manager (can be omitted - enabled by default)
  programs.home-manager.enable = true;
}
