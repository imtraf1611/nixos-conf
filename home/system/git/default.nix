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

      "result"
      "result-*"

      "auto-save-list"
    ];

    extraConfig = {
      credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
      push = {
        autoSetupRemote = true;
      };
    };

    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
    };
  };
}
