-- jiri Setting my options for Neovim.
-- Include this file to main init.lua
--
-- options from primeagen -----------------------------------------------
-- vim.opt.guicursor = "" -- thick cursor

vim.opt.number = true -- line numbers
vim.opt.relativenumber = false -- relative line numbers

vim.opt.tabstop = 4 -- number of spaces created by pressing tab
vim.opt.softtabstop = 4 -- 
vim.opt.shiftwidth = 4 -- automatic indentation size in spaces
vim.opt.expandtab = true -- changes tabs to spaces (on save)

vim.opt.smartindent = true -- smart autoindenting when starting new line

vim.opt.wrap = false -- disables line wrapping by default

vim.opt.swapfile = false 
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true -- enables 24 bit color support + nicer highlithing

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- options from kickstart -------------------------------------------

vim.g.have_nerd_font = false
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true -- new windows open at the bottom
vim.opt.splitbelow = true -- new splits open on the right side 
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split' -- show macro preview in a split
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- options from Vhyrro

vim.opt.clipboard = "unnamedplus" -- synchronizes neovims and systems clipboards
vim.opt.virtualedit = "block" -- makes working in block mode nicer
















-- ahoj
