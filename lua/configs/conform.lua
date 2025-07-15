local util = require "conform.util"

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    css = { "local_prettier", "prettierd", "prettier", stop_after_first = true },
    html = { "local_prettier", "prettierd", "prettier", stop_after_first = true },
    javascript = { "local_prettier", "prettierd", "prettier", stop_after_first = true },
    typescript = { "local_prettier", "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "local_prettier", "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "local_prettier", "prettierd", "prettier", stop_after_first = true },
    markdown = { "local_prettier", "prettierd", "prettier", stop_after_first = true },
    json = { "local_prettier", "prettierd", "prettier", stop_after_first = true },
  },

  formatters = {
    local_prettier = {
      command = util.find_executable({
        "./node_modules/.bin/prettier",
      }, "prettier"),
      args = { "--stdin-filepath", "$FILENAME" },
      stdin = true,
      cwd = util.root_file { "package.json", ".git" },
    },
  },

  notify_on_error = true,

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2000,
    lsp_fallback = true,
  },
}

return options
