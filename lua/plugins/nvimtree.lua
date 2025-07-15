return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        -- recommended settings
        sort_by = "case_sensitive",
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
      })

      vim.keymap.set("n", "<leader>q", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
      vim.keymap.set("n", "<leader>Q", ":NvimTreeFocus<CR>", { desc = "Focus the File Explorer" })
    end,
  },
}
