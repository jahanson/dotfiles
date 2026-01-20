return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local on_publish_diagnostics = vim.lsp.diagnostic.on_publish_diagnostics
    local util = require("lspconfig.util")
    opts.servers.bashls = vim.tbl_deep_extend("force", opts.servers.bashls or {}, {
      handlers = {
        ["textDocument/publishDiagnostics"] = function(err, res, ...)
          local file_name = vim.fn.fnamemodify(vim.uri_to_fname(res.uri), ":t")
          if string.match(file_name, "^%.env") ~= nil then
            return
          end
          return on_publish_diagnostics(err, res, ...)
        end,
      },
    })

    -- Enable fish shell language server support
    opts.servers.fish_lsp = vim.tbl_deep_extend("force", opts.servers.fish_lsp or {}, {
      cmd = { "fish-lsp", "start" },
      filetypes = { "fish" },
    })

    -- Deno and Typescript
    local deno_root = util.root_pattern("deno.json", "deno.jsonc", "import_map.json")
    local ts_root = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json")

    local deno_from_file
    local ensure_denols

    -- Deno configuration
    local function deno_settings_for_root(root)
      if not root then
        return {}
      end
      for _, name in ipairs({ "deno.json", "deno.jsonc", "deno.config.json", "deno.config.jsonc" }) do
        local path = root .. "/" .. name
        if vim.fn.filereadable(path) == 1 then
          return { config = vim.fs.normalize(path) }
        end
      end
      return {}
    end

    opts.servers.denols = vim.tbl_deep_extend("force", opts.servers.denols or {}, {
      root_dir = function(fname)
        return deno_from_file(fname)
      end,
      single_file_support = true,
      init_options = { lint = true },
      settings = {
        deno = {
          enable = true,
          ---@diagnostic disable-next-line: assign-type-mismatch
          config = vim.NIL,
          suggest = {
            imports = {
              hosts = {
                ["https://deno.land"] = true,
                ["https://cdn.skypack.dev"] = true,
              },
            },
          },
        },
      },
    })

    opts.setup = opts.setup or {}

    local typescript_root = function(fname)
      if deno_from_file(fname) then
        return nil
      end
      return ts_root(fname)
    end

    opts.servers.vtsls = vim.tbl_deep_extend("force", opts.servers.vtsls or {}, {
      enabled = false,
    })

    opts.servers.ts_ls = vim.tbl_deep_extend("force", opts.servers.ts_ls or {}, {
      root_dir = typescript_root,
      single_file_support = false,
    })

    opts.servers.tsserver = vim.tbl_deep_extend("force", opts.servers.tsserver or {}, {
      enabled = false,
    })

    vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
      pattern = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      callback = function(event)
        ensure_denols(event.buf)
      end,
    })

    -- Implementation details for Deno heuristics live below to keep config near the top.
    deno_from_file = function(fname)
      -- Normalize input to a filename (supports passing buffer number or nothing)
      if type(fname) == "number" then
        fname = vim.api.nvim_buf_get_name(fname)
      end
      if not fname or fname == "" then
        fname = vim.api.nvim_buf_get_name(0)
      end
      if not fname or fname == "" then
        return nil
      end

      -- Prefer explicit project roots (deno.json, import map, etc.) when present
      local root = deno_root(fname)
      if root then
        return root
      end

      if vim.fn.filereadable(fname) == 0 then
        return nil
      end

      -- Fall back to scanning the first few lines for Deno-specific markers
      local ok, lines = pcall(vim.fn.readfile, fname, "", 10)
      if not ok or not lines then
        return nil
      end

      for i, line in ipairs(lines) do
        -- Shebang that invokes Deno implies the file's directory is the root
        if i == 1 and line:match("^#!") and line:match("deno") then
          return vim.fn.fnamemodify(fname, ":p:h")
        end
        -- Inline directives or config hints point to a Deno context
        if line:match("deno%-lint%-ignore") or line:match("deno%.json") then
          return vim.fn.fnamemodify(fname, ":p:h")
        end
        -- Direct references to the global Deno namespace or runtime imports
        if line:match("Deno%.") or line:match("deno:runtime") then
          return vim.fn.fnamemodify(fname, ":p:h")
        end
        -- Common CDN import patterns seen in Deno scripts
        if line:match("https://deno%.land") or line:match("https://cdn%.skypack%.dev") then
          return vim.fn.fnamemodify(fname, ":p:h")
        end
      end

      return nil
    end

    ensure_denols = function(bufnr)
      local root = deno_from_file(bufnr)
      if not root then
        return
      end

      local clients = vim.lsp.get_clients({ bufnr = bufnr })
      local has_denols = false
      for _, client in ipairs(clients) do
        if client.name == "denols" then
          has_denols = true
        elseif client.name == "ts_ls" or client.name == "tsserver" or client.name == "vtsls" then
          vim.lsp.stop_client(client.id)
        end
      end

      if has_denols then
        return
      end

      local config = vim.lsp.config.denols
      if not config then
        -- register default config if missing
        require("lspconfig.configs").denols = require("lspconfig").denols.document_config
        config = vim.lsp.config.denols
      end

      if config then
        local settings = vim.tbl_deep_extend("force", {}, config.settings or {})
        settings.deno = vim.tbl_deep_extend("force", settings.deno or {}, deno_settings_for_root(root))
        local new_config = vim.tbl_deep_extend("force", {}, config, {
          settings = settings,
          root_dir = root,
        })
        vim.lsp.start(new_config, { bufnr = bufnr })
      end
    end
  end,
}
