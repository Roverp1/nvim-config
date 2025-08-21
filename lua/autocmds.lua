-- Group names
local resizing_fix = vim.api.nvim_create_augroup("resizingFix", { clear = true })
local highlight_yank = vim.api.nvim_create_augroup("highlightYank", { clear = true })

-- AUTOCMD FUNCTION
-- try keep splits equally sized after automatic resizing
vim.api.nvim_create_autocmd({ "VimResized", "WinLeave" }, {
  pattern = "*",
  command = "wincmd =",
  desc = "Equalize splits when terminal window is resized or buffer left",
  group = resizing_fix,
})

-- center page when resizing
vim.api.nvim_create_autocmd({ "VimResized" }, {
  pattern = "*",
  command = "normal! zz",
  desc = "Center page when terminal window is resized",
  group = resizing_fix,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = highlight_yank,
  callback = function()
    vim.highlight.on_yank { timeout = 100 }
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json" },
  callback = function()
    vim.api.nvim_set_option_value("formatprg", "jq .", { scope = "local" })
  end,
})

-- Frontend files use 2 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "json",
    "jsonc",
    "yaml",
    "markdown",
  },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end,
})
