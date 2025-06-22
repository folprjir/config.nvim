return {
  "machakann/vim-sandwich",

  config = function()
      vim.g["sandwich#recipes"] = vim.g["sandwich#recipes"] or {}
      vim.list_extend(vim.g["sandwich#recipes"], {
        { buns = { "<div>", "</div>" }, filetype = { "html", "javascriptreact", "typescriptreact" }, input = { "d" } },
        { buns = { "<section>", "</section>" }, filetype = { "html", "javascriptreact", "typescriptreact" }, input = { "s" } },
        { buns = { "<article>", "</article>" }, filetype = { "html", "javascriptreact", "typescriptreact" }, input = { "a" } },
        { buns = { "<header>", "</header>" }, filetype = { "html", "javascriptreact", "typescriptreact" }, input = { "h" } },
        { buns = { "<footer>", "</footer>" }, filetype = { "html", "javascriptreact", "typescriptreact" }, input = { "f" } },
        { buns = { "<span>", "</span>" }, filetype = { "html", "javascriptreact", "typescriptreact" }, input = { "p" } },
        { buns = { "<!-- ", " -->" }, filetype = { "html", "javascriptreact", "typescriptreact" }, input = { "c" } },
      })
    end,
}
