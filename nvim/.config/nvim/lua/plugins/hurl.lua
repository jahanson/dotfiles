return {
  "samueljoli/hurl.nvim",
  lazy = false,
  init = function()
    vim.filetype.add({
      extension = {
        hurl = "hurl",
      },
    })
  end,
  config = function()
    require("hurl").setup({
      comment = "#ebc021",
      method = "#fffc58",
      url = "#fffc58",
      version = "#032ea7",
      status = "#032ea7",
      section = "#032ea7",
      operators = "#c592ff",
      string = "#032ea7",
      -- or just {} to use your colorscheme’s defaults
    })
  end,
}
