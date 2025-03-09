return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },

    event = 'InsertEnter',
    config = function()
      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local lspkind = require("lspkind")

      cmp.setup({
	sources = {
	  { name = "nvim_lua", keyword_length = 5 },
	  { name = "nvim_lsp" },
	  { name = "path" },
	  { name = "luasnip" },
	  { name = "buffer" },
	},
	mapping = cmp.mapping.preset.insert({
	  ["<C-Space>"] = cmp.mapping.complete(),
	  ["<C-u>"] = cmp.mapping.scroll_docs(-4),
	  ["<C-d>"] = cmp.mapping.scroll_docs(4),
	  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
	}),
	snippet = {
	  expand = function(args)
	    vim.snippet.expand(args.body)
	  end,
	},
	formatting = {
	  format = lspkind.cmp_format {
	    with_text = true,
	    menu = {
	      buffer = "[buf]",
	      nvim_lsp = "[LSP]",
	      nvim_lua = "[api]",
	      path = "[path]",
	      luasnip = "[snip]",
	    },
	  },
	  expandable_indicator = true,
	  fields = { "abbr" , "kind", "menu"}
	},
      })
    end
  },
}
--[[
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      keymap = { preset = 'default' },
      appearance = {
	use_nvim_cmp_as_default = true,
	nerd_font_variant = 'mono'
      },
      signature = { enabled = true }
    },
  },
  ]]--
