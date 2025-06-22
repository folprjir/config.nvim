return {
  {
    "echasnovski/mini.nvim",
    config = function()
      local statusline = require("mini.statusline")
      statusline.setup { use_icons = true }
      -- local surround = require("mini.surround")
      -- surround.setup()
    end
  }
}
