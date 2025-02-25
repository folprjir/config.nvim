return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
	  library = {
	    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
	  },
	},
      },
    },
  },


  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },


  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require("mason-lspconfig").setup_handlers({
	function (server_name)
	  require("lspconfig")[server_name].setup({
	    capabilities = capabilities
	  })
	end,
      })
    end,
  },
}
