return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },

    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },

        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },

        lua = { "stylua" },
        python = { "ruff_format" },
        blade = { "blade-formatter" },
      },
    },

    config = function(_, opts)
      local conform = require("conform")

      conform.setup(opts)

      local eslint_filetypes = {
        javascript = true,
        javascriptreact = true,
        typescript = true,
        typescriptreact = true,
      }

      local group = vim.api.nvim_create_augroup("ProjectFormatOnSave", { clear = true })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,

        callback = function(event)
          local bufnr = event.buf
          local filetype = vim.bo[bufnr].filetype

          -- ESLint first:
          -- sort imports and remove unused imports.
          if eslint_filetypes[filetype] then
            local eslint_clients = vim.lsp.get_clients({
              bufnr = bufnr,
              name = "eslint",
            })

            if #eslint_clients > 0 then
              vim.api.nvim_buf_call(bufnr, function()
                if vim.fn.exists(":LspEslintFixAll") == 2 then
                  vim.cmd("silent LspEslintFixAll")
                end
              end)
            end
          end

          -- Prettier second.
          conform.format({
            bufnr = bufnr,
            async = false,
            timeout_ms = 3000,
            lsp_format = "fallback",
          })
        end,
      })

      vim.keymap.set({ "n", "v" }, "<leader>f", function()
        conform.format({
          bufnr = vim.api.nvim_get_current_buf(),
          async = true,
          lsp_format = "fallback",
        })
      end, {
        desc = "Format buffer",
      })
    end,
  },
}
