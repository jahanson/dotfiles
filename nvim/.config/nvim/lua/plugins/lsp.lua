return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ts_ls = {
        root_dir = require("lspconfig").util.root_pattern({ "package.json", "tsconfig.json" }),
        single_file_support = false,
        settings = {},
      },
      denols = {
        root_dir = require("lspconfig").util.root_pattern({ "deno.json", "deno.jsonc" }),
        single_file_support = false,
        settings = {},
      },
      bashls = {},
    },
  },
}
