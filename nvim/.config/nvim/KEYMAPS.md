# Keymaps

Leader key is `<Space>`. Press and wait to see available keymaps via which-key.

## Custom Keymaps

### File Explorer

| Key | Mode | Description |
|-----|------|-------------|
| `\|` | n | Toggle Neo-tree |

### OpenCode (AI Assistant)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>oa` | n, x | Ask about this |
| `<leader>os` | n, x | Select prompt |
| `<leader>o+` | n, x | Add this to context |
| `<leader>ot` | n | Toggle embedded terminal |
| `<leader>oc` | n | Select command |
| `<leader>on` | n | New session |
| `<leader>oi` | n | Interrupt session |
| `<leader>oA` | n | Cycle selected agent |
| `<S-C-u>` | n | Messages half page up |
| `<S-C-d>` | n | Messages half page down |

### Triforce (Gamification)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>tp` | n | Show profile |

---

## LazyVim Defaults

### General

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>` | n | Show keymaps (which-key) |
| `<leader>qq` | n | Quit all |
| `<leader>fn` | n | New file |
| `<leader>xl` | n | Location list |
| `<leader>xq` | n | Quickfix list |

### Files & Search

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ff` | n | Find files |
| `<leader>fr` | n | Recent files |
| `<leader>fb` | n | Buffers |
| `<leader>fg` | n | Live grep |
| `<leader>fw` | n | Grep word under cursor |
| `<leader>e` | n | Explorer (Neo-tree) |
| `<leader>fe` | n | Explorer (Neo-tree) |

### Code

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>cf` | n, v | Format |
| `<leader>cd` | n | Line diagnostics |
| `<leader>cr` | n | Rename |
| `<leader>ca` | n, v | Code action |
| `gd` | n | Go to definition |
| `gr` | n | Go to references |
| `gI` | n | Go to implementation |
| `gy` | n | Go to type definition |
| `K` | n | Hover documentation |
| `gK` | n | Signature help |
| `]d` | n | Next diagnostic |
| `[d` | n | Previous diagnostic |
| `]e` | n | Next error |
| `[e` | n | Previous error |

### Buffers

| Key | Mode | Description |
|-----|------|-------------|
| `<S-h>` | n | Previous buffer |
| `<S-l>` | n | Next buffer |
| `<leader>bb` | n | Switch to other buffer |
| `<leader>bd` | n | Delete buffer |
| `<leader>bo` | n | Delete other buffers |

### Windows

| Key | Mode | Description |
|-----|------|-------------|
| `<C-h>` | n | Go to left window |
| `<C-j>` | n | Go to lower window |
| `<C-k>` | n | Go to upper window |
| `<C-l>` | n | Go to right window |
| `<leader>-` | n | Split below |
| `<leader>\|` | n | Split right |
| `<leader>wd` | n | Delete window |

### Git

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>gg` | n | Lazygit |
| `<leader>gf` | n | Lazygit file history |
| `<leader>gb` | n | Git blame line |
| `<leader>gB` | n | Git browse |
| `]h` | n | Next hunk |
| `[h` | n | Previous hunk |
| `<leader>ghp` | n | Preview hunk |
| `<leader>ghs` | n | Stage hunk |
| `<leader>ghr` | n | Reset hunk |

### Flash (Navigation)

| Key | Mode | Description |
|-----|------|-------------|
| `s` | n, x, o | Flash jump |
| `S` | n, x, o | Flash treesitter |
| `r` | o | Remote flash |
| `R` | o, x | Treesitter search |

### Trouble (Diagnostics)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>xx` | n | Diagnostics (Trouble) |
| `<leader>xX` | n | Buffer diagnostics |
| `<leader>cs` | n | Symbols (Trouble) |
| `<leader>cS` | n | LSP references |

### UI Toggles

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>uf` | n | Toggle format on save |
| `<leader>us` | n | Toggle spelling |
| `<leader>uw` | n | Toggle word wrap |
| `<leader>ul` | n | Toggle line numbers |
| `<leader>ud` | n | Toggle diagnostics |
| `<leader>uc` | n | Toggle conceal |
| `<leader>uh` | n | Toggle inlay hints |

### Terminal

| Key | Mode | Description |
|-----|------|-------------|
| `<C-/>` | n | Terminal (root dir) |
| `<C-_>` | n | Terminal (root dir) |
| `<Esc><Esc>` | t | Exit terminal mode |

---

## Discovery

- Press `<leader>` and wait for which-key popup
- `:Telescope keymaps` - searchable keymap list
- `:map` - list all mappings
