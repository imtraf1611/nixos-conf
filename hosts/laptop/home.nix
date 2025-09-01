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

    # System
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
    ../../home/system/yazi

    # Programs
    ../../home/programs/discord
    ../../home/programs/ghostty
    ../../home/programs/zen-browser
  ];

  home = {
    # Set the home directory path for our user
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    # Packages
    packages = with pkgs; [
      # Apps
      youtube-music

      # Development - Languages/Tools
      nodejs_22
      bun
      yarn
      pnpm
      python3

      # Dev - Editors/IDEs
      vscode

      # Utilities
      grc
      zip
      unzip
      tree
      btop
      fish
      oh-my-posh
      fastfetch
      libgtkflow3
      gtk3
      bat

      # Misc
      cava
      bluez
      ddcutil
      brightnessctl
      imagemagick

      # Formatting
      nixfmt-rfc-style
    ];

    sessionVariables = {
      # Prisma
      PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
      PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
      PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";

      # Nix-ld
      LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
    };

    # State version - don't touch this
    stateVersion = "25.05";
  };

  # Enable Home Manager
  programs.home-manager = {
    enable = true;
  };
}
