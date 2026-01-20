# Changelog

All notable changes to this Neovim configuration are documented here.

## 2026-01-19

### Performance

- **wakatime**: Changed from `lazy = false` to `event = "VeryLazy"` to defer HTTP sync until after UI renders
- **triforce**: Added `event = "VeryLazy"` and moved lualine integration into plugin config function
- **opencode**: Converted to `keys`-based lazy loading - plugin only loads on first `<leader>o*` keypress
- **lazy.lua**: Removed eager `require("triforce.lualine")` that was blocking startup
