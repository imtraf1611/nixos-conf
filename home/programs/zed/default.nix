{ pkgs, lib, ... }:

{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "material-icon-theme"
      "nix"
      "biome"
      "react-typescript-snippets"
      "prisma"
      "color-highlight"
      "emmet"
    ];

    userSettings = {
      inlay_hints = {
        enabled = true;
        show_value_hints = true;
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = true;
        show_background = false;
        edit_debounce_ms = 700;
        scroll_debounce_ms = 50;
        toggle_on_modifiers_press = {
          control = false;
          alt = false;
          shift = false;
          platform = false;
          function = false;
        };
      };

      base_keymap = "VSCode";
      buffer_font_size = 20;

      icon_theme = {
        mode = "system";
        dark = "Material Icon Theme";
        light = "Material Icon Theme";
      };

      languages = {
        Nix = {
          formatter = {
            external = {
              command = "nixfmt";
              arguments = [
                "--quiet"
                "--"
              ];
            };
          };
          format_on_save = "on";
        };
      };

      load_direnv = "shell_hook";

      lsp = {
        nix = {
          binary = {
            path_lookup = true;
          };
        };
      };

      show_whitespaces = "selection";

      terminal = {
        alternate_scroll = "off";
        blinking = "off";
        button = false;
        copy_on_select = true;
        detect_venv = {
          on = {
            activate_script = "default";
            directories = [
              ".env"
              "env"
              ".venv"
              "venv"
            ];
          };
        };
        dock = "bottom";
        env = {
          TERM = "ghostty";
        };
        font_family = "JetBrainsMono Nerd Font";
        font_features = null;
        font_size = 14;
        line_height = "comfortable";
        option_as_meta = false;
        shell = "system";
        toolbar = {
          breadcrumbs = false;
        };
        working_directory = "current_project_directory";
        cursor_shape = "bar";
      };

      theme = {
        dark = "Imtraf Dark";
        light = "One Light";
        mode = "system";
      };

      ui_font_family = "JetBrainsMono Nerd Font";
      ui_font_size = 14;

      "project_panel" = {
        "indent_guides" = {
          "show" = "never";
        };
        "indent_size" = 12;
      };
      "indent_guides" = {
        "enabled" = true;
      };

      vim_mode = false;

      formatter = {
        external = {
          command = "biome";
          arguments = [
            "format"
            "--write"
            "--stdin-file-path={buffer_path}"
          ];
        };
      };
    };
  };

  xdg.configFile = {
    "zed/themes" = {
      source = ./themes;
      recursive = true;
    };
  };
}
