-- ~/.config/nvim/lua/plugins/lint.lua
return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      local lint = require("lint")

      -- CORRECTED MASON CALL (proper Lua syntax)
      local function get_shellcheck_path()
        -- Fallback to system shellcheck
        return vim.fn.exepath("shellcheck") ~= "" and "shellcheck" or nil
      end

      -- Validate shellcheck exists
      local shellcheck_path = get_shellcheck_path()
      if not shellcheck_path then
        vim.notify("ShellCheck not found! Install via :Mason", vim.log.levels.ERROR)
        return
      end

      lint.linters.shellcheck = {
        name = "shellcheck",
        cmd = shellcheck_path,
        stdin = true,
        args = { "-f", "gcc", "-" },
        stream = "stderr",
        ignore_exitcode = true,
        parser = function(output, bufnr)
          local items = {}
          for line in output:gmatch("[^\r\n]+") do
            local source, line_num, col, sev, msg = line:match("^([^:]+):(%d+):(%d+): (%a+): (.*)$")
            if source and line_num and col and sev and msg then
              table.insert(items, {
                lnum = tonumber(line_num) - 1,
                col = tonumber(col) - 1,
                severity = ({
                  error = vim.diagnostic.severity.ERROR,
                  warning = vim.diagnostic.severity.WARN,
                  info = vim.diagnostic.severity.INFO,
                  hint = vim.diagnostic.severity.HINT,
                })[sev:lower()] or vim.diagnostic.severity.INFO,
                message = msg,
                source = source,
              })
            end
          end
          return items
        end,
      }

      -- Auto-lint for shell scripts
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*.sh", "*.bash", "*.zsh" },
        callback = function()
          if vim.bo.filetype:match("sh") then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
