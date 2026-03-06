# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration built on LazyVim. All configuration is in Lua. See ARCHITECTURE.md for detailed structure.

## Key Commands

```bash
# Test configuration loads without errors
nvim --headless -c 'quitall'

# Check startup time
nvim --startuptime /tmp/startup.log -c 'quitall' && cat /tmp/startup.log

# View plugin load times (inside Neovim)
:Lazy profile
```

## Architecture

- **Entry point**: `init.lua` → `require("config.lazy")`
- **Plugin specs**: `lua/plugins/*.lua` - each file returns a lazy.nvim spec
- **Config modules**: `lua/config/` - options, keymaps, autocmds (loaded on VeryLazy)
- **Post-load scripts**: `plugin/after/` - runs after all plugins load

## Key Patterns

### Extending LazyVim Plugins

Return a spec with the same plugin name to merge with LazyVim's config:

```lua
return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers.my_server = { ... }
  end,
}
```

### Lazy Loading

Custom plugins load at startup by default (`defaults.lazy = false` in lazy.lua). Use these to defer:
- `event = "VeryLazy"` - after UI renders
- `event = "BufReadPost"` - on file open
- `keys = { ... }` - on keypress (best for keybinding-driven plugins)

## LSP Configuration

`lua/plugins/lsp.lua` implements smart Deno vs TypeScript detection:
- Deno: activates for `deno.json`, `deno.jsonc`, or files with Deno markers (shebang, `Deno.*`, deno.land imports)
- TypeScript (ts_ls): activates for `package.json`, `tsconfig.json` when not a Deno project
- vtsls and tsserver are disabled to avoid conflicts

## Enabled Language Extras

Configured in `lazyvim.json`: cmake, docker, git, go, markdown, python, rust, sql, tailwind, toml, yaml
