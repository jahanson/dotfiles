# Systems

This document catalogs every plugin and third-party system loaded in this Neovim configuration.

## Quick Reference

| Category | Plugins |
|----------|---------|
| **Framework** | LazyVim, lazy.nvim |
| **Completion & Snippets** | blink.cmp, friendly-snippets, lazydev.nvim |
| **LSP & Diagnostics** | nvim-lspconfig, mason.nvim, mason-lspconfig, trouble.nvim, SchemaStore.nvim |
| **Syntax & Treesitter** | nvim-treesitter, textobjects, autotag, ts-comments |
| **Formatting & Linting** | conform.nvim, nvim-lint |
| **Navigation & Search** | neo-tree, flash.nvim, grug-far.nvim, which-key |
| **UI Components** | lualine, bufferline, noice, nui, snacks, mini.icons, mini.hipatterns |
| **Editing** | mini.ai, mini.pairs, todo-comments |
| **Git** | gitsigns.nvim |
| **Colorschemes** | tokyonight, catppuccin, ethereal |
| **Language-Specific** | rustaceanvim, cmake-tools, crates.nvim, venv-selector |
| **Database** | vim-dadbod, dadbod-ui, dadbod-completion |
| **Markdown** | markdown-preview, render-markdown |
| **Sessions** | persistence.nvim |
| **AI & Productivity** | opencode.nvim, vim-wakatime, triforce.nvim, volt |
| **Utilities** | plenary.nvim |

---

## Framework

### LazyVim
**Repository**: [LazyVim/LazyVim](https://github.com/LazyVim/LazyVim)

A Neovim setup powered by lazy.nvim that provides sensible defaults, extensive plugin pre-configuration, and a modular extras system. Serves as the foundation for this configuration, handling LSP setup, keybindings, and UI defaults.

### lazy.nvim
**Repository**: [folke/lazy.nvim](https://github.com/folke/lazy.nvim)

Modern plugin manager for Neovim with lazy-loading, lockfile support, automatic UI, and profiling. Manages all plugin installation, updates, and load ordering.

---

## Completion & Snippets

### blink.cmp
**Repository**: [saghen/blink.cmp](https://github.com/saghen/blink.cmp)

High-performance completion plugin that updates on every keystroke (0.5-4ms async). Supports LSP, buffer, path, and snippet sources. Features typo-resistant fuzzy matching with frecency and proximity bonuses. Includes cmdline completion and auto-bracket insertion via semantic tokens.

### friendly-snippets
**Repository**: [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

Collection of preconfigured snippets for many programming languages. Provides ready-to-use snippets that integrate with completion engines.

### lazydev.nvim
**Repository**: [folke/lazydev.nvim](https://github.com/folke/lazydev.nvim)

Faster Lua development plugin that provides enhanced autocomplete and type information for Neovim's Lua API. Replacement for neodev.nvim, loading only required modules to speed up completion. Essential for editing Neovim configuration files.

---

## LSP & Diagnostics

### nvim-lspconfig
**Repository**: [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

Quickstart configurations for Neovim's built-in LSP client. Provides ready-to-use configs for language servers. This configuration extends it with custom servers: bashls (with .env filtering), fish_lsp, denols, and ts_ls.

### mason.nvim
**Repository**: [mason-org/mason.nvim](https://github.com/mason-org/mason.nvim)

Portable package manager for Neovim that installs and manages LSP servers, DAP servers, linters, and formatters. Provides a unified interface for tool installation across platforms.

### mason-lspconfig.nvim
**Repository**: [mason-org/mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)

Bridge between mason.nvim and nvim-lspconfig. Ensures language servers installed via Mason are automatically configured with lspconfig.

### trouble.nvim
**Repository**: [folke/trouble.nvim](https://github.com/folke/trouble.nvim)

Pretty diagnostics list showing errors, warnings, and other LSP diagnostics in a dedicated window. Provides workspace-wide diagnostic navigation and quickfix list management.

### SchemaStore.nvim
**Repository**: [b0o/SchemaStore.nvim](https://github.com/b0o/SchemaStore.nvim)

Provides access to the SchemaStore.org catalog, enabling JSON and YAML language servers to validate files against known schemas (package.json, tsconfig.json, GitHub Actions, etc.).

---

## Syntax & Treesitter

### nvim-treesitter
**Repository**: [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Treesitter configurations and abstraction layer for Neovim. Provides fast, accurate syntax highlighting, code folding, and indentation based on AST parsing. This config ensures parsers for: bash, html, javascript, json, kdl, lua, markdown, python, query, regex, tsx, typescript, vim, yaml.

### nvim-treesitter-textobjects
**Repository**: [nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)

Syntax-aware text objects for functions, classes, parameters, and other code structures. Enables motions like "select inner function" or "go to next class".

### nvim-ts-autotag
**Repository**: [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)

Automatically closes and renames HTML/JSX tags using Treesitter. When you type `<div>`, it auto-inserts `</div>`; when you rename one tag, both update.

### ts-comments.nvim
**Repository**: [folke/ts-comments.nvim](https://github.com/folke/ts-comments.nvim)

Treesitter-based commenting that understands embedded languages. Correctly comments JSX inside JavaScript, SQL inside strings, etc.

---

## Formatting & Linting

### conform.nvim
**Repository**: [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)

Lightweight formatter plugin supporting format-on-save and async formatting. This config uses: prettier (markdown), dockerfmt (Dockerfile), shfmt (shell scripts).

### nvim-lint
**Repository**: [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)

Asynchronous linter plugin complementing LSP diagnostics. This config uses shellcheck for shell scripts, auto-linting on save.

---

## Navigation & Search

### neo-tree.nvim
**Repository**: [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)

File explorer with tree view, git status integration, and floating window support. Provides filesystem navigation, buffer list, and git status views.

### flash.nvim
**Repository**: [folke/flash.nvim](https://github.com/folke/flash.nvim)

Fast code navigation using search labels and enhanced character motions. Press `s` to type characters, then a label appears at each match for instant jumping. Includes Treesitter integration for jumping to syntax nodes (functions, classes).

### grug-far.nvim
**Repository**: [MagicDuck/grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim)

Find and replace plugin using ripgrep and ast-grep. Opens a dedicated buffer for searching across files with multiline support. Results are editable and can sync changes back to source files.

### which-key.nvim
**Repository**: [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

Displays keybinding hints in a popup when you start a key sequence. Shows available completions after pressing leader key or any prefix, making keybindings discoverable.

---

## UI Components

### lualine.nvim
**Repository**: [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

Fast and customizable statusline written in Lua. Displays mode, file info, git branch, diagnostics, and custom components like triforce stats.

### bufferline.nvim
**Repository**: [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

Buffer line (tab bar) with tabpage integration. Shows open buffers as tabs with icons, close buttons, and diagnostics indicators.

### noice.nvim
**Repository**: [folke/noice.nvim](https://github.com/folke/noice.nvim)

Replaces Neovim's default UI for messages, cmdline, and popupmenu. Renders the command line as a popup with syntax highlighting, routes messages to notifications, and eliminates the "Press ENTER" prompt.

### nui.nvim
**Repository**: [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim)

UI component library providing popup, input, menu, and layout primitives. Used by noice.nvim and other plugins for rendering floating windows.

### snacks.nvim
**Repository**: [folke/snacks.nvim](https://github.com/folke/snacks.nvim)

Collection of small QoL plugins including: file pickers, floating terminal, dashboard, notifications, scroll animations, indent guides, git browse, scratch buffers, and more. Provides `Snacks.picker` for fuzzy finding and `Snacks.toggle` for feature toggles.

### mini.icons
**Repository**: [echasnovski/mini.icons](https://github.com/echasnovski/mini.icons)

Icon provider for file types, LSP kinds, and other UI elements. Lightweight alternative to nvim-web-devicons.

### mini.hipatterns
**Repository**: [echasnovski/mini.hipatterns](https://github.com/echasnovski/mini.hipatterns)

Highlight patterns in text, such as TODO/FIXME comments, hex colors, and custom patterns. Colors are displayed inline as virtual text.

---

## Editing Enhancements

### mini.ai
**Repository**: [echasnovski/mini.ai](https://github.com/echasnovski/mini.ai)

Extends Neovim's text objects with additional targets: function arguments, brackets, quotes, and custom objects. Enables motions like `daa` (delete around argument).

### mini.pairs
**Repository**: [echasnovski/mini.pairs](https://github.com/echasnovski/mini.pairs)

Auto-pairs for brackets, quotes, and other paired characters. Inserts closing pair automatically and handles backspace/enter intelligently.

### todo-comments.nvim
**Repository**: [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

Highlights TODO, FIXME, HACK, and other comment keywords with distinct colors. Provides commands to search and list all todo comments in a project.

---

## Git Integration

### gitsigns.nvim
**Repository**: [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

Git signs in the sign column showing added, modified, and deleted lines. Provides inline blame, hunk staging/unstaging, and diff preview.

---

## Colorschemes

### tokyonight.nvim
**Repository**: [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

Clean dark theme with multiple styles (night, storm, day, moon). The default colorscheme for this configuration with extensive plugin highlight support.

### catppuccin
**Repository**: [catppuccin/nvim](https://github.com/catppuccin/nvim)

Soothing pastel theme with four flavors: Latte, Frappe, Macchiato, Mocha. Comprehensive support for Treesitter, LSP, and popular plugins.

### ethereal.nvim
**Repository**: [presindent/ethereal.nvim](https://github.com/presindent/ethereal.nvim)

Dark colorscheme based on Tokyodark with modified color palette.

---

## Language-Specific

### rustaceanvim
**Repository**: [mrcjkb/rustaceanvim](https://github.com/mrcjkb/rustaceanvim)

Supercharges Rust development by automatically configuring rust-analyzer LSP. Provides debugging integration, test running, inlay hints, and cargo commands. Does not require nvim-lspconfig—handles LSP independently.

### cmake-tools.nvim
**Repository**: [Civitasv/cmake-tools.nvim](https://github.com/Civitasv/cmake-tools.nvim)

CMake integration providing configure, build, and run commands. Manages build targets and integrates with DAP for debugging.

### crates.nvim
**Repository**: [saecki/crates.nvim](https://github.com/saecki/crates.nvim)

Manages Cargo.toml dependencies. Shows available versions, provides update actions, and displays crate documentation inline.

### venv-selector.nvim
**Repository**: [linux-cultist/venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim)

Python virtual environment selector. Searches for venvs in the project and allows switching between them, automatically updating the LSP.

---

## Database

### vim-dadbod
**Repository**: [tpope/vim-dadbod](https://github.com/tpope/vim-dadbod)

Database client supporting PostgreSQL, MySQL, SQLite, and others. Execute queries and view results directly in Neovim.

### vim-dadbod-ui
**Repository**: [kristijanhusak/vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui)

UI for vim-dadbod providing a drawer with saved connections, table exploration, and query history.

### vim-dadbod-completion
**Repository**: [kristijanhusak/vim-dadbod-completion](https://github.com/kristijanhusak/vim-dadbod-completion)

Completion source for vim-dadbod providing table names, column names, and SQL keywords.

---

## Markdown

### markdown-preview.nvim
**Repository**: [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

Live markdown preview in browser. Opens a browser tab that updates in real-time as you edit markdown files.

### render-markdown.nvim
**Repository**: [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)

Renders markdown inside Neovim with concealed syntax, colored headings, and inline previews.

---

## Sessions & Persistence

### persistence.nvim
**Repository**: [folke/persistence.nvim](https://github.com/folke/persistence.nvim)

Session management that automatically saves and restores sessions per directory. Remembers open buffers, window layout, and cursor positions.

---

## AI & Productivity

### opencode.nvim
**Repository**: [NickvanDyke/opencode.nvim](https://github.com/NickvanDyke/opencode.nvim)

Integrates the opencode AI assistant for editor-aware research, code reviews, and requests. Auto-connects to opencode instances in the working directory. Provides prompts for code context (`@this`, `@diff`, `@buffer`) and functions for ask, select, toggle embedded terminal.

### vim-wakatime
**Repository**: [wakatime/vim-wakatime](https://github.com/wakatime/vim-wakatime)

Automatic time tracking for coding activity. Sends heartbeats to WakaTime service to generate productivity metrics and dashboards.

### triforce.nvim
**Repository**: [gisketch/triforce.nvim](https://github.com/gisketch/triforce.nvim)

Gamification plugin adding XP, levels, and achievements to coding sessions. Earn XP from typing, new lines, and saves. Integrates with lualine to display level progress, achievement count, streak, and session time in the statusline.

### volt
**Repository**: [nvzone/volt](https://github.com/nvzone/volt)

UI framework for creating reactive, interactive interfaces in Neovim. Dependency of triforce.nvim, provides the rendering foundation for its profile display.

---

## Utilities

### plenary.nvim
**Repository**: [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

Lua utility library providing async primitives, path manipulation, testing framework, and common functions. Dependency for many plugins including gitsigns and telescope.
