{pkgs, ...}: {
  programs.nvf = {
    enable = true;

    settings.vim = {
      vimAlias = true;
      viAlias = true;
      withNodeJs = true;

      lineNumberMode = "number";

      options = {
        tabstop = 2;
        shiftwidth = 2;
        wrap = false;
      };

      keymaps = [
        {
          key = "jk";
          mode = ["i"];
          action = "<ESC>";
          desc = "Exit insert mode";
        }
        {
          key = "<leader>nh";
          mode = ["n"];
          action = ":nohl<CR>";
          desc = "Clear search highlights";
        }
        {
          key = "<leader>ff";
          mode = ["n"];
          action = "<cmd>Telescope find_files<cr>";
          desc = "Search files by name";
        }
        {
          key = "<leader>fg";
          mode = ["n"];
          action = "<cmd>Telescope live_grep<cr>";
          desc = "Search files by contents";
        }
        {
          key = "<leader>fe";
          mode = ["n"];
          action = "<cmd>Neotree toggle<cr>";
          desc = "File browser toggle";
        }
        {
          key = "<leader>bo";
          mode = ["n"];
          action = "<cmd>BufferLineCloseOthers<cr>";
          desc = "Close other buffers";
        }
        {
          key = "<leader>bx";
          mode = ["n"];
          action = "<cmd>BufferLinePickClose<cr>";
          desc = "Pick and close buffer";
        }
        {
          key = "<leader>dt";
          mode = ["n"];
          action = "<cmd>lua if vim.diagnostic.is_enabled() then vim.diagnostic.enable(false) else vim.diagnostic.enable() end<cr>";
          desc = "Toggle diagnostics";
        }
        {
          key = "<C-h>";
          mode = ["i"];
          action = "<Left>";
          desc = "Move left in insert mode";
        }
        {
          key = "<C-j>";
          mode = ["i"];
          action = "<Down>";
          desc = "Move down in insert mode";
        }
        {
          key = "<C-k>";
          mode = ["i"];
          action = "<Up>";
          desc = "Move up in insert mode";
        }
        {
          key = "<C-l>";
          mode = ["i"];
          action = "<Right>";
          desc = "Move right in insert mode";
        }
      ];

      telescope.enable = true;

      spellcheck = {
        enable = true;
      };

      lsp = {
        enable = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
        lspSignature.enable = true;
        otter-nvim.enable = false;
        nvim-docs-view.enable = false;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        clang.enable = true;
        python.enable = true;
        markdown = {
          enable = true;
          extensions.render-markdown-nvim.enable = true;
        };
        terraform.enable = true;
        ts.enable = true;
        html.enable = true;
        yaml.enable = true;
      };

      visuals = {
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;

        highlight-undo.enable = true;
        indent-blankline.enable = true;
      };

      statusline = {
        lualine = {
          enable = true;
        };
      };

      autopairs.nvim-autopairs.enable = true;

      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;

      tabline = {
        nvimBufferline = {
          enable = true;
          setupOpts.options.separator_style = "slant";
        };
      };

      treesitter.context = {
        enable = true;
        setupOpts = {
          max_lines = 5;
          trim_scope = "inner";
        };
      };

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false; # throws an annoying debug message
      };

      projects.project-nvim.enable = true;
      dashboard.dashboard-nvim.enable = true;

      filetree.neo-tree.enable = true;

      notify = {
        nvim-notify.enable = true;
      };

      utility = {
        ccc.enable = false;
        vim-wakatime.enable = false;
        icon-picker.enable = true;
        surround.enable = true;
        diffview-nvim.enable = true;
        motion = {
          hop.enable = true;
          leap.enable = true;
          precognition.enable = false;
        };

        images.image-nvim = {
          enable = true;
          setupOpts.backend = "kitty";
        };
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        illuminate.enable = true;
        breadcrumbs = {
          enable = false;
          navbuddy.enable = false;
        };
        smartcolumn = {
          enable = false;
        };
        fastaction.enable = true;
      };

      session = {
        nvim-session-manager.enable = false;
      };

      comments = {
        comment-nvim.enable = true;
      };

      extraPlugins = {
        cyberdream = {
          package = pkgs.vimPlugins.cyberdream-nvim;
          setup = ''
            require("cyberdream").setup {
              variant = "auto";
              transparent = true;
            }

            vim.cmd("colorscheme cyberdream")
          '';
        };

        committia = {
          package = pkgs.vimPlugins.committia;
        };

        zen-mode-nvim = {
          package = pkgs.vimPlugins.zen-mode-nvim;
        };
      };
    };
  };
}
