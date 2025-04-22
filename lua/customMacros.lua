local setreg = vim.fn.setreg
local map = vim.keymap.set
local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

-- example for macro
-- setreg("l", "yoconsole.log(`pa: ${pa}`);_")

create_augroup("JSLogMacro", { clear = true })

create_autocmd("FileType", {
  group = "JSLogMacro",
  pattern = { "javascript", "typescript", "javascriptreact" },
  callback = function()
    map("v", "<leader>ml", "yoconsole.log(`pa: ${pa}`);_", { desc = "Log selected" })
  end,
})
