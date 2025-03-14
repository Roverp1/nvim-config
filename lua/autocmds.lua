-- Group names
local resizing_fix = vim.api.nvim_create_augroup("resizing_fix", { clear = true })
local highlight_yank = vim.api.nvim_create_augroup("highlight_yank", { clear = true })
local folds_restore = vim.api.nvim_create_augroup("folds_restore", { clear = true })

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

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = folds_restore,
  pattern = "*",
  command = "silent! loadview",
})

vim.api.nvim_create_autocmd("BufWinLeave", {
  group = folds_restore,
  pattern = "*",
  command = "silent! mkview",
})
