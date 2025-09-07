{ pkgs, lib, ... }:

{
  programs.zed-editor = {
    enable = true;

    ## This populates the userSettings "auto_install_extensions"
    extensions = [
      "nix"
      "toml"
      "elixir"
      "make"
      "material-icon-theme"
    ];

    ## everything inside of these brackets are Zed options.
    userSettings = {
      terminal = {
        alternate_scroll = "off";
        blinking = "off";
        copy_on_select = false;
        dock = "bottom";
        detect_venv = {
          on = {
            directories = [
              ".env"
              "env"
              ".venv"
              "venv"
            ];
            activate_script = "default";
          };
        };
        env = {
          TERM = "alacritty";
        };
        font_family = "JetBrainsMono Nerd Font";
        font_features = null;
        font_size = null;
        line_height = "comfortable";
        option_as_meta = false;
        button = false;
        shell = "system";
        toolbar = {
          title = true;
        };
        working_directory = "current_project_directory";
      };

      lsp = {
        rust-analyzer = {
          binary = {
            # path = lib.getExe pkgs.rust-analyzer;
            path_lookup = true;
          };
        };

        nix = {
          binary = {
            path_lookup = true;
          };
        };

        elixir-ls = {
          binary = {
            path_lookup = true;
          };
          settings = {
            dialyzerEnabled = true;
          };
        };
      };

      languages = {
        "Elixir" = {
          language_servers = [
            "!lexical"
            "elixir-ls"
            "!next-ls"
          ];
          format_on_save = {
            external = {
              command = "mix";
              arguments = [
                "format"
                "--stdin-filename"
                "{buffer_path}"
                "-"
              ];
            };
          };
        };
        "HEEX" = {
          language_servers = [
            "!lexical"
            "elixir-ls"
            "!next-ls"
          ];
          format_on_save = {
            external = {
              command = "mix";
              arguments = [
                "format"
                "--stdin-filename"
                "{buffer_path}"
                "-"
              ];
            };
          };
        };
      };

      vim_mode = false;
      ## tell zed to use direnv and direnv can use a flake.nix enviroment.
      load_direnv = "shell_hook";
      base_keymap = "VSCode";
      theme = {
        mode = "system";
        light = "One Light";
        dark = "One Dark";
      };
      show_whitespaces = "selection";
      ui_font_family = "JetBrainsMono Nerd Font";
      ui_font_size = 16;
      buffer_font_size = 16;
    };
  };
}
