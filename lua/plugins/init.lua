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
}
