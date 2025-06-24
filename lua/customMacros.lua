local setreg = vim.fn.setreg
local map = vim.keymap.set
local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

-- example for macro
-- setreg("l", "yoconsole.log(`pa: ${pa}`);_")

create_augroup("JSLogMacro", { clear = true })

create_autocmd("FileType", {
  group = "JSLogMacro",
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = function()
    map("v", "<leader>mls", "yoconsole.log(`pa: ${pa}`);_", { desc = "Log selected as string" })
    map("v", "<leader>mll", 'yoconsole.log("pa:", pa);_', { desc = "Log selected" })
  end,
})

create_augroup("JSXUseStateMacro", { clear = true })

create_autocmd("FileType", {
  group = "JSXUseStateMacro",
  pattern = { "javascriptreact", "typescriptreact" },
  callback = function()
    map(
      "n",
      "<leader>mru",
      "yiwea, setpblll~A = useState();",
      { desc = "Complete useState destructuring from current name" }
    )
  end,
})
