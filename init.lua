-- require("options")

-- require("autocommands")

require("config.lazy")
require("remaps")


-- vim.opt.number = true -- turns on line numbers
-- vim.opt.relativenumber = true

-- vim.opt.splitbelow = true -- new windows open at the bottom
-- vim.opt.splitright = true -- new splist open on the right side

vim.opt.wrap = false -- disables line wrapping by default

-- vim.opt.expandtab = true -- chenges tabs to spaces
-- vim.opt.shiftwidth = 4 -- changes tabs to spaces on save
-- vim.opt.tabstop = 4 -- 

--vim.opt.clipboard = "unnamedplus" -- synchornizies clipboard with the systems clipboard
-- vim.opt.scrolloff = 999 -- keeps cursor in the middle

-- vim.opt.virtualedit = "block" -- makes working with block mode nicer

-- vim.opt.inccommand = "split" -- show macro previews in split

-- vim.opt.ignorecase = true -- ingores case in neovim

-- vim.opt.termguicolors = true -- enables 24 bit color support + nicer highlithing


vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":.lua<CR>")

-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})











































