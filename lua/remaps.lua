-- jiri These are my keymaps.
-- Include this file to main init.lua


local set = vim.keymap.set

vim.g.mapleader = " "
set("n", "<leaderxpv", vim.cmd.Ex)

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- greatest remap ever
set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
set("i", "<C-c>", "<Esc>")

set("n", "Q", "<nop>")
set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- set("n", "<leader>f", vim.lsp.buf.format)

set("n", "<M-j>", "<cmd>cnext<CR>zz")
set("n", "<M-k>", "<cmd>cprev<CR>zz")
set("n", "<leader>k", "<cmd>lnext<CR>zz")
set("n", "<leader>j", "<cmd>lprev<CR>zz")

set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
set("n", "<leader>mg", "<cmd>CellularAutomaton game_of_life<CR>");

-- set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)
--
set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
end)
