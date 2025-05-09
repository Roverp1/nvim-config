local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascriptreact = { "prettier" },
    python = { "black" },
    markdown = { "prettier" },
    -- c = { "clang-format" },
    json = { "prettier" },
  },

  notify_on_error = true,

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
