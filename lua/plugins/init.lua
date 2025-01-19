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

  -- {
  --   "nvimtools/none-ls.nvim",
  --   config = function()
  --     local null_ls = require "null-ls"
  --     null_ls.setup {
  --       sources = {
  --         null_ls.builtins.formatting.stylua,
  --
  --         null_ls.builtins.formatting.prettier,
  --         -- null_ls.builtins.formatting.htmlbeautifier,
  --         null_ls.builtins.diagnostics.eslint_d,
  --
  --         null_ls.builtins.formtting.black,
  --         null_ls.builtins.diagnostics.ruff,
  --       },
  --     }
  --   end,
  -- },
}
