require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- UNMAP
map("n", "<C-i>", "<C-i>zz", { desc = "Go to next jump" })

--

map("i", "jk", "<ESC>")

map("i", "jl", function()
  require("cmp").close()
end, { desc = "Hide LSP popup menu in insert mode" })

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

map("n", "<leader>sa", "gg<S-v>G", { desc = "󰒆 Select All" })

-- Change window size
map("n", "<C-'>", "<Cmd>vertical resize +2<CR>", { desc = "Resize window width by +2" })
map("n", "<C-;>", "<Cmd>vertical resize -2<CR>", { desc = "Resize window width by -2" })
map("n", "<C-+>", "<Cmd>horizontal resize +2<CR>", { desc = "Resize window height by +2" })
map("n", "<C-->", "<Cmd>horizontal resize -2<CR>", { desc = "Resize window height by -2" })
map("n", "<C-=>", "<C-w>=", { desc = "Resize window to default" })
-- ------------
-- | PLUGINS  |
-- ------------

-- Live Server
map("n", "<leader>tl", "<cmd>LiveServerToggle<cr>", { desc = " Toggle Live Server" })

-- Minty color picker:
map("n", "<leader>cc", "<cmd>lua require('minty.huefy').open()<cr>", { desc = " Open Minty Huefy color picker" })

-- Render Markdown
map("n", "<leader>tm", "<cmd>RenderMarkdown toggle<cr>", { desc = " Toggle Markdown Render" })

-- Prettier (Conform)
map("n", "<leader>gf", function()
  require("conform").format { async = true }
end, { desc = " Format code with Conform" })

-- Telescope
map("n", "<leader>wt", "<CMD>Telescope keymaps<CR>", { desc = "Keymap cheatsheet in Telescope" })
