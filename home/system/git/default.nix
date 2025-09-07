{
  pkgs,
  config,
  ...
}:
let
  username = config.var.git.username;
  email = config.var.git.email;
in
{
  programs.git = {
    enable = true;

    userName = username;
    userEmail = email;

    ignores = [
      ".cache/"
      ".direnv/"
      "node_modules"

      ".DS_Store"
      ".idea"
      "*.swp"
      "*.elc"
    ];

    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
    };

    extraConfig = {
      credential = {
        helper = "manager";
        "https://github.com".username = username;
        credentialStore = "cache";
      };
    };
  };
}
