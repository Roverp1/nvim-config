require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

o.relativenumber = true
-- o.cmdheight = 0
o.scrolloff = 5

-- Default indentation (4 spaces)
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
