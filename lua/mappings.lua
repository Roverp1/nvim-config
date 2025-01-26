require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>wt", "<CMD>Telescope keymaps<CR>", { desc = "Keymap cheatsheet in Telescope" })

-- none-ls keybinds
-- map("n", "<leader>gf", vim.lsp.buf.format, {})

map("n", "<leader>gf", function()
  require("conform").format { async = true }
end, { desc = "Format code with Conform" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- remaps for centring
map("n", "<C-d>", "<C-d>zz", { desc = "Jump half a page down and center the screeen" })
map("n", "<C-u>", "<C-u>zz", { desc = "Jump half a page up and center the screeen" })

map("n", "n", "nzz", { desc = "Jump to the next occurence of the word and center the screeen" })
map("n", "N", "Nzz", { desc = "Jump to the privous occurence of the word and center the screeen" })

map("n", "*", "*zz", { desc = "Jump to the next occurence of the current word and center the screeen" })
map("n", "#", "#zz", { desc = "Jump to the preivous occurence of the current word and center the screeen" })

map("n", "{", "{zz", { desc = "Jump to the start of the block and center the screeen" })
map("n", "}", "}zz", { desc = "Jump to the end of the block and center the screeen" })

----------------------------------------------

map("n", "x", '"_x', { desc = "Save deleted character to the underlying register" })

map("n", "<leader>sa", "gg<S-v>G", { desc = "select all" })
