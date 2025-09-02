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
<<<<<<< HEAD
=======
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
>>>>>>> d0db58d (add assets)
      bar = {
        status = {

        };
        persistent = true;
        showOnHover = true;
      };
      paths = {
        mediaGif = "root:/assets/bongocat.gif";
<<<<<<< HEAD
        sessionGif = "~/Pictures/Gifs/kurukuru.gif";
=======
        sessionGif = "~/Pictures/Gifs/jingliu.gif";
>>>>>>> d0db58d (add assets)
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
