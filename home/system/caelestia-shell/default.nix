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
          family = {
            mono = "JetBrains Mono";
          };
          size = {
            scale = 1;
          };
        };
      };
      bar = {
        status = {

        };
        persistent = true;
        showOnHover = true;
      };
      paths = {
        mediaGif = "root:/assets/bongocat.gif";
        sessionGif = "~/Pictures/Gifs/jingliu.gif";
        wallpaperDir = "~/Pictures/Wallpapers";
      };
      border = {
        rounding = 12;
        thickness = 8;
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
