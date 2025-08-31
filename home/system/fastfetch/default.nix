{
  config,
  lib,
  pkgs,
  ...
}:
{
  xdg.configFile = {
    "fastfetch/config.jsonc" = {
      source = ./config.jsonc;
    };
    "fastfetch/rem.png" = {
      source = ./images/rem.png;
    };
  };
}
