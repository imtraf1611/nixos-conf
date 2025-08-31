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
      paths = {
        mediaGif = "root:/assets/bongocat.gif";
        sessionGif = "~/Pictures/Gifs/kurukuru.gif";
        wallpaperDir = "~/Pictures/Wallpapers";
      };
      border = {
        rounding = 4;
        thickness = 2;
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
