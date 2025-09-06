{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [ inputs.caelestia-shell.homeManagerModules.default ];

  programs.caelestia = {
    enable = true;
    settings = {
      appearance = {
        font = {
          size = {
            scale = 1;
          };
        };
        padding = {
          scale = 1;
        };
        rounding = {
          scale = 1;
        };
        spacing = {
          scale = 1;
        };
      };
      bar = {
        persistent = false;
        showOnHover = false;
      };
      dashboard = {
        showOnHover = false;
      };
      paths = {
        mediaGif = "root:/assets/bongocat.gif";
        sessionGif = "~/Pictures/Gifs/jingliu.gif";
        wallpaperDir = "~/Pictures/Wallpapers";
      };
      border = {
        rounding = 12;
        thickness = 4;
      };
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
