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

-- map("i", "jj", function()
--   require("cmp").open()
-- end, { desc = "Open LSP popup menu in insert mode" })

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

map("n", "gb", "vato<ESC>zz", { desc = "󰅴 Go to opening of a tag" })
map("n", "ge", "vat<ESC>zz", { desc = "󰅴 Go to closing of a tag" })

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

-- "christoomey/vim-tmux-navigator"
map("n", "<c-h>", "<cmd> TmuxNavigateLeft<cr>", { desc = "Select left nvim/tmux pane" })
map("n", "<c-j>", "<cmd> TmuxNavigateDown<cr>", { desc = "Select bottom nvim/tmux pane" })
map("n", "<c-k>", "<cmd> TmuxNavigateUp<cr>", { desc = "Select bottom nvim/tmux pane" })
map("n", "<c-l>", "<cmd> TmuxNavigateRight<cr>", { desc = "Select bottom nvim/tmux pane" })
map("n", "<c-\\>", "<cmd> TmuxNavigatePrevious<cr>", { desc = "Select bottom nvim/tmux pane" })

-- -------------
-- | ADVANCED  |
-- -------------
-- maps with functions

map("n", "<leader>ir", function()
  local file_name = vim.fn.expand "%:t:r"
  local lines = {
    'import "./' .. file_name .. '.scss";',
    "",
    "const " .. file_name .. " = () => {",
    "  return (",
    "    <>",
    "      <div></div>",
    "    </>",
    "  );",
    "};",
    "",
    "export default " .. file_name .. ";",
  }

  vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
  vim.api.nvim_win_set_cursor(0, { 6, 0 })
end, { desc = " Initialize React component" })
