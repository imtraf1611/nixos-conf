{
  inputs,
  config,
  pkgs,
  ...
}:
{
  programs.oh-my-posh = {
    enable = true;
    settings = builtins.fromJSON (
      builtins.unsafeDiscardStringContext (builtins.readFile ./themes/emodipt-extend.omp.json)
    );
  };
}
