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

  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require "null-ls"
      null_ls.setup {
        sources = {
          null_ls.builtins.diagnostics.eslint_d.with {
            diagnostics_format = "[eslint_d] #{m} (#{c})",
          },
        },
        debug = true,
      }
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
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
}
