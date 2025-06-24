return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,

      highlight = {
        enable = true, -- Enable syntax highlighting
      },
    },
  },

  -- {
  --   "nvimtools/none-ls.nvim",
  --   dependencies = {
  --     "nvimtools/none-ls-extras.nvim",
  --   },
  --   event = "VeryLazy",
  --
  --   config = function()
  --     local null_ls = require "null-ls"
  --     null_ls.setup {
  --       sources = {
  --         require "none-ls.diagnostics.eslint",
  --       },
  --     }
  --   end,
  -- },

  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local autotag = require "nvim-ts-autotag"

      autotag.setup {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype

        -- per_filetype = {
        -- ["html"] = {
        --    enable_close = false
        --  }
        -- }
      }
    end,
  },

  {
    "barrett-ruth/live-server.nvim",
    cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },

    config = function()
      local live_server = require "live-server"

      live_server.setup {
        build = "pnpm add -g live-server",
        cmd = { "LiveServerStart", "LiveServerStop" },
        config = true,
      }
    end,
  },

  {
    "echasnovski/mini.icons",
    version = false,
    -- dependencies = { "MeanderingProgrammer/render-markdown.nvim" },
    opts = {

      -- Icon style: 'glyph' or 'ascii'
      style = "glyph",

      -- Customize per category. See `:h MiniIcons.config` for details.
      default = {},
      directory = {},
      extension = {},
      file = {},
      filetype = {},
      lsp = {},
      os = {},

      -- Control which extensions will be considered during "file" resolution
      use_file_extension = function(ext, file)
        return true
      end,
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
    ft = { "markdown", "quarto" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      enabled = false,
    },
  },

  {
    "hrsh7th/nvim-cmp",

    -- BUG after this commit
    -- getting error after typing `$` in .sass/.scss files
    -- added temporary fix on 17.03.25
    commit = "b356f2c80cb6c5bae2a65d7f9c82dd5c3fdd6038",
  },

  {
    "antosha417/nvim-lsp-file-operations",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },

  {
    "3rd/image.nvim",
    event = "VeryLazy",
    -- dependencies = {
    --   {
    --     "nvim-treesitter/nvim-treesitter",
    --     build = ":TSUpdate",
    --     config = function()
    --       require("nvim-treesitter.configs").setup {
    --         ensure_installed = { "markdown" },
    --         highlight = { enable = true },
    --       }
    --     end,
    --   },
    -- },
    config = function()
      require("image").setup {
        backend = "kitty",
        kitty_method = "normal",
        integrations = {
          -- Notice these are the settings for markdown files
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            -- Set this to false if you don't want to render images coming from
            -- a URL
            download_remote_images = true,
            -- Change this if you would only like to render the image where the
            -- cursor is at
            -- I set this to true, because if the file has way too many images
            -- it will be laggy and will take time for the initial load
            -- only_render_image_at_cursor = true,
            only_render_image_at_cursor = vim.g.neovim_mode == "skitty" and false or true,
            -- markdown extensions (ie. quarto) can go here
            filetypes = { "markdown", "vimwiki", "html" },
          },
          neorg = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "norg" },
          },
          -- This is disabled by default
          -- Detect and render images referenced in HTML files
          -- Make sure you have an html treesitter parser installed
          -- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/treesitter.lua
          html = {
            enabled = true,
            only_render_image_at_cursor = true,
            -- Enabling "markdown" below allows you to view html images in .md files
            -- https://github.com/3rd/image.nvim/issues/234
            -- filetypes = { "html", "xhtml", "htm", "markdown" },
            filetypes = { "html", "xhtml", "htm" },
          },
          -- This is disabled by default
          -- Detect and render images referenced in CSS files
          -- Make sure you have a css treesitter parser installed
          -- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/treesitter.lua
          css = {
            enabled = true,
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,

        -- This is what I changed to make my images look smaller, like a
        -- thumbnail, the default value is 50
        -- max_height_window_percentage = 20,
        -- max_height_window_percentage = 40,
        -- 40 for my default nvim config and 30 for skitty
        max_height_window_percentage = vim.g.neovim_mode == "skitty" and 30 or 40,

        -- toggles images when windows are overlapped
        window_overlap_clear_enabled = false,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },

        -- auto show/hide images when the editor gains/looses focus
        -- editor_only_render_when_focused = true,
        -- editor_only_render_when_focused = vim.g.neovim_mode == "skitty" and false or true,

        -- auto show/hide images in the correct tmux window
        -- In the tmux.conf add `set -g visual-activity off`
        -- tmux_show_only_in_active_window = true,

        -- render image files as images when opened
        -- hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
      }
    end,
  },

  -- {
  --   "HiPhish/rainbow-delimiters.nvim",
  --   lazy = true,
  --   event = "VeryLazy",
  --   config = function()
  --     require("rainbow-delimiters.setup").setup {
  --       blacklist = { "html" },
  --     }
  --   end,
  -- },

  -- debugger setup(
  -- {
  --   "mfussenegger/nvim-dap",
  --   dependencies = {
  --     "rcarriga/nvim-dap-ui",
  --     "nvim-neotest/nvim-nio",
  --   },
  --   event = "VeryLazy",
  --
  --   config = function()
  --     local dap = require "dap"
  --     local dapui = require "dapui"
  --
  --     dap.listeners.before.attach.dapui_config = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.launch.dapui_config = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated.dapui_config = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited.dapui_config = function()
  --       dapui.close()
  --     end
  --
  --     vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint(), { desc = "toggle breakpoint" })
  --     vim.keymap.set("n", "<Leader>dc", dap.continue, {})
  --   end,
  -- },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  {
    "rmagatti/auto-session",
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- log_level = 'debug',
    },
  },

  {
    "danymat/neogen",
    dependencies = { "L3MON4D3/LuaSnip" },
    cmd = "Neogen",
    keys = {
      {
        "<leader>gng",
        function()
          require("neogen").generate {}
        end,
        desc = "Generate Neogen annotation",
      },
      {
        "<leader>gnf",
        function()
          require("neogen").generate { type = "func" }
        end,
        desc = "Generate Neogen annotation for function",
      },
    },

    config = function()
      local neogen = require "neogen"

      neogen.setup {
        snippet_engine = "luasnip",
      }
    end,
  },

  {
    "rest-nvim/rest.nvim",
    ft = { "http" }, -- only load for .http files
    cmd = { "Rest open", "Rest run", "Rest logs" }, -- also works on demand
    keys = {
      {
        "<leader>rr",
        "<cmd>Rest run<CR>",
        desc = "󰗖 Run HTTP request",
        ft = "http",
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    },
  },

  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    ---@type TailwindTools.Option
    opts = {
      document_color = {
        enabled = true, -- can be toggled by commands
        kind = "inline", -- "inline" | "foreground" | "background"
        inline_symbol = "󱓻 ", -- only used in inline mode
      },
      conceal = {
        enabled = true, -- can be toggled by commands
        min_length = 100, -- only conceal classes exceeding the provided length
        symbol = "󱏿", -- only a single character is allowed
      },
    },
  },

  {
    "pwntester/octo.nvim",
    cmd = { "Octo" },
    keys = {
      { "<leader>oo", "<cmd>Octo<cr>", desc = " Octo" },
      { "<leader>op", "<cmd>Octo pr list<cr>", desc = "Octo pr list" },
    },
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup {
        enable_builtin = true,
        use_local_fs = true,
      }
      vim.cmd [[hi OctoEditable guibg=none]]
      vim.treesitter.language.register("markdown", "octo")
    end,
  },

  {
    "fasterius/simple-zoom.nvim",
    cmd = { "SimpleZoomToggle" },
    keys = {
      { "<leader>z", "<cmd>SimpleZoomToggle<CR>", desc = "Zoom toggle" },
    },
    opts = {
      hide_tabline = true,
    },
  },
}
