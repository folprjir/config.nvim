return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "jbyuki/one-small-step-for-vimkind",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      require("dapui").setup()
      require("dap-go").setup()

      require("nvim-dap-virtual-text").setup()

      dap.configurations.lua = {
	{
	  type = 'nlua',
	  request = 'attach',
	  name = "Attach to running Neovim instance",
	  on_init = function()
	  vim.opt.swapfile = false
	end,
	},
      }

      dap.adapters["local-lua"] = {
	type = "executable",
	command = "node",
	args = {
	  -- "/absolute/path/to/local-lua-debugger-vscode/extension/debugAdapter.js"
	  "/home/jiri/Plocha/lua/debugger/local-lua-debugger-vscode/extension/debugAdapter.js",
	},
	enrich_config = function(config, on_config)
	  if not config["extensionPath"] then
	    local c = vim.deepcopy(config)
	    -- 💀 If this is missing or wrong you'll see 
	    -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
	    -- c.extensionPath = "/absolute/path/to/local-lua-debugger-vscode/"
	    c.extensionPath = "/home/jiri/Plocha/lua/debugger/local-lua-debugger-vscode/"
	    on_config(c)
	  else
	    on_config(config)
	  end
	end,
      }

      dap.adapters.nlua = function(callback, config)
	callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
      end

      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymap.set("n", "<space>?", function()
        require("dapui").eval(nil, { enter = true })
      end)

      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F12>", dap.restart)

      vim.keymap.set('n', '<leader>dl', function()
	require"osv".launch({port = 8086})
      end, { noremap = true })

      vim.keymap.set("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", {noremap=true})

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
