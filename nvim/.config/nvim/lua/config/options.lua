-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false
-- Fix Mason binaries in Arch's minimal PATH
vim.env.PATH = table.concat({
  "/home/jahanson/.local/share/nvim/mason/bin",
  "/home/jahanson/.cargo/bin",
  "/usr/local/sbin",
  "/usr/local/bin",
  "/usr/bin",
  "/usr/sbin",
  "/sbin",
  vim.env.PATH,
}, ":")
