return {
  "gisketch/triforce.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvzone/volt",
  },
  config = function()
    require("triforce").setup({
      keymap = {
        show_profile = "<leader>tp",
      },
    })

    -- Setup lualine integration after triforce loads
    local triforce = require("triforce.lualine").components()
    require("lualine").setup({
      sections = {
        lualine_x = {
          triforce.level,
          triforce.achievements,
          triforce.streak,
          triforce.session_time,
          "encoding",
          "fileformat",
          "filetype",
        },
      },
    })
  end,
}
