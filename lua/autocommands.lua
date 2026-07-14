return {
  vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
  }),

  vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
    end,
  }),
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "blade" },
    callback = function(args)
      pcall(vim.treesitter.start, args.buf, "blade")
    end,
  }),
}
