local o = vim.o
local wo = vim.wo
local bo = vim.bo
local opt = vim.opt

-- global options
vim.g.mapleader = " "
vim.g.maplocalleader = " "
o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
o.clipboard = 'unnamedplus'
o.hidden = true
o.shiftwidth = 4
o.tabstop = 4

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- ... snip ...

-- window-local options
wo.wrap = false

wo.number = true
wo.relativenumber = true
wo.cursorline = true
-- buffer-local options
bo.expandtab = true


vim.wo.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldenable = false -- can be enabled directly in opened file - using 'zi' - toogle fold
vim.opt.updatetime = 50
opt.colorcolumn = "80"
