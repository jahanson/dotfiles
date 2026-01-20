return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local ensure = {
        "bash",
        "html",
        "javascript",
        "json",
        "kdl",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      }

      opts.ensure_installed = opts.ensure_installed or {}
      for _, lang in ipairs(ensure) do
        if not vim.tbl_contains(opts.ensure_installed, lang) then
          table.insert(opts.ensure_installed, lang)
        end
      end

      if vim.treesitter.language.register then
        -- Use the YAML parser for docker compose buffers so highlighting works.
        vim.treesitter.language.register("yaml", "yaml.docker-compose")
      end
    end,
  },
}
