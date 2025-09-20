{
  pkgs,
  lib,
  ...
}: {
  programs.zed-editor = {
    enable = true;

    extensions = [
      "material-icon-theme"
      "nix"
      "biome"
      "prisma"
      "react-typescript-snippets"
      "color-highlight"
      "emmet"
    ];

    userSettings = {
      agent = {
        inline_assistant_model = {
          provider = "google";
          model = "gemini-2.5-flash";
        };
      };

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
      buffer_font_size = 24;

      icon_theme = {
        mode = "system";
        dark = "Material Icon Theme";
        light = "Material Icon Theme";
      };

      languages = {
        Nix = {
          language_servers = ["nixd" "!nil"];
          formatter = {
            external = {
              command = "alejandra";
              arguments = ["--quiet" "--"];
            };
          };
          format_on_save = "on";
        };
        JavaScript = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };
        TypeScript = {
          inlay_hints = {
            enabled = false;
          };
          formatter = {
            language_server = {
              name = "biome";
            };
          };
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };
        TSX = {
          inlay_hints = {
            enabled = false;
          };
          formatter = {
            language_server = {
              name = "biome";
            };
          };
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };
        JSON = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };
        JSONC = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };
        CSS = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };
        GraphQL = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };
        Prisma = {
          formatter = "language_server";
          language_servers = ["prisma-language-server"];
        };
      };

      load_direnv = "shell_hook";

      lsp = {
        nixd = {
          settings = {
            diagnostic = {
              suppress = ["sema-extra-with"];
            };
          };
          initialization_options = {
            formatting = {
              command = ["alejandra" "--quiet" "--"];
            };
          };
        };
        biome = {
          settings = {
            require_config_file = false;
          };
        };
      };

      format_on_save = "on";

      git_panel = {
        dock = "right";
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
            directories = [".env" "env" ".venv" "venv"];
          };
        };
        dock = "bottom";
        env = {
          TERM = "ghostty";
        };
        font_family = "JetBrainsMono Nerd Font";
        font_features = null;
        font_size = 16;
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
      ui_font_size = 16;

      vim_mode = false;

      project_panel = {
        indent_guides = {
          show = "never";
        };
        indent_size = 12;
      };

      indent_guides = {
        enabled = true;
      };
    };
  };

  xdg.configFile."zed/themes" = {
    source = ./themes;
    recursive = true;
  };
}
