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
            scale = 0.8;
          };
        };
        padding = {
          scale = 0.8;
        };
        rounding = {
          scale = 0.8;
        };
        spacing = {
          scale = 0.8;
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
