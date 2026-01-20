return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      markdown = { "prettier" },
      -- Use dockerfmt for Dockerfiles (preserves indentation properly)
      dockerfile = { "dockerfmt" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2", "-ci", "-sr" },
      },
      dockerfmt = {
        command = "dockerfmt",
        args = { "-i", "2", "$FILENAME" },
        stdin = false,
      },
    },
  },
}

