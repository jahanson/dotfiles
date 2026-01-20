-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle neo-tree with Shift+|
vim.keymap.set("n", "<Bar>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })
