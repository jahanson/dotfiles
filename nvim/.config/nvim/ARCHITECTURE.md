# Architecture

This Neovim configuration is built on [LazyVim](https://www.lazyvim.org/) as a base framework, using [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

## Directory Structure

```
.
├── init.lua                 # Entry point - bootstraps lazy.nvim
├── lazyvim.json             # LazyVim extras configuration
├── lazy-lock.json           # Locked plugin versions (auto-generated)
│
├── lua/
│   ├── config/              # Core configuration modules
│   │   ├── lazy.lua         # Plugin manager setup
│   │   ├── options.lua      # Neovim options
│   │   ├── keymaps.lua      # Custom keybindings
│   │   └── autocmds.lua     # Autocommands
│   │
│   └── plugins/             # Plugin specifications
│       └── *.lua            # Each file returns a plugin spec or table of specs
│
└── plugin/
    └── after/               # Scripts that run after plugins load
```

## Boot Sequence

```
init.lua
  └─> require("config.lazy")
       ├─> Bootstrap lazy.nvim (clone if missing)
       ├─> Load LazyVim base plugins
       ├─> Load LazyVim extras (from lazyvim.json)
       ├─> Load lua/plugins/*.lua specs
       └─> Trigger config modules on VeryLazy:
            ├─> lua/config/options.lua
            ├─> lua/config/keymaps.lua
            └─> lua/config/autocmds.lua
```

## Configuration Modules

### lua/config/lazy.lua

The central configuration for lazy.nvim. Key settings:

- **spec**: Imports LazyVim base (`lazyvim.plugins`) and local plugins (`plugins/`)
- **defaults.lazy**: Set to `false` - custom plugins load at startup unless they specify lazy loading
- **performance.rtp.disabled_plugins**: Built-in Vim plugins disabled for faster startup

### lua/config/options.lua

Neovim options that override LazyVim defaults. Loaded on the `VeryLazy` event.

### lua/config/keymaps.lua

Custom keybindings that extend or override LazyVim defaults. Loaded on `VeryLazy`.

### lua/config/autocmds.lua

Custom autocommands. LazyVim's built-in autocmds use the `lazyvim_` prefix.

## Plugin System

### Adding Plugins

Create a file in `lua/plugins/` that returns a plugin spec:

```lua
-- lua/plugins/example.lua
return {
  "owner/repo",
  opts = {
    -- plugin options
  },
}
```

Or return multiple specs:

```lua
return {
  { "owner/repo1", opts = {} },
  { "owner/repo2", opts = {} },
}
```

### Extending LazyVim Plugins

To modify a plugin that LazyVim already configures, return a spec with the same plugin name. Specs are merged:

```lua
-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- opts contains LazyVim's defaults
    opts.servers.custom_server = { ... }
  end,
}
```

### Lazy Loading Strategies

| Strategy | When to Use | Example |
|----------|-------------|---------|
| `event = "VeryLazy"` | Defer until after UI renders | Time tracking, gamification |
| `event = "BufReadPost"` | Load when opening a file | Linting, formatting |
| `keys = { ... }` | Load on keypress | Keybinding-driven tools |
| `cmd = { ... }` | Load on command | Rarely-used utilities |
| `ft = { ... }` | Load for specific filetypes | Language-specific plugins |
| (none) | Load at startup | Core functionality |

### Plugin Spec Reference

```lua
return {
  "owner/repo",

  -- Loading triggers (pick one or combine)
  event = "VeryLazy",           -- Event name or table
  keys = { { "<leader>x", ... } }, -- Keymaps that trigger load
  cmd = { "Command" },          -- Commands that trigger load
  ft = { "lua", "python" },     -- Filetypes that trigger load

  -- Dependencies
  dependencies = { "other/plugin" },

  -- Configuration
  opts = {},                    -- Passed to plugin.setup()
  config = function() end,      -- Custom setup (runs after opts)
  init = function() end,        -- Runs at startup (before plugin loads)
}
```

## LazyVim Extras

Language packs and features are enabled via `lazyvim.json`:

```json
{
  "extras": [
    "lazyvim.plugins.extras.lang.python",
    "lazyvim.plugins.extras.lang.rust",
    "lazyvim.plugins.extras.editor.neo-tree"
  ]
}
```

Browse available extras with `:LazyExtras`.

## Post-Plugin Scripts

Files in `plugin/after/` run after all plugins have loaded. Useful for:

- Highlight overrides that depend on colorschemes
- Configuration that must run last

## Useful Commands

| Command | Description |
|---------|-------------|
| `:Lazy` | Open lazy.nvim UI |
| `:Lazy profile` | View startup time per plugin |
| `:Lazy sync` | Update and install plugins |
| `:LazyExtras` | Browse and toggle LazyVim extras |
| `:checkhealth` | Diagnose configuration issues |
