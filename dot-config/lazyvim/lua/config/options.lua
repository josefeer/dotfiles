-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.pumblend = 0 -- disabled transparency for LSP autocomplete features

vim.diagnostic.config({
  float = { border = "rounded" },
})

-- Disable Tabline on Top, we are using lualine instead
vim.opt.showtabline = 0

-- Disable highlighting of the current line
vim.opt.cursorline = false

-- Disable Autoformat
vim.g.autoformat = false

-- Disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog = '/home/jose/.nvim-venv/bin/python3'

-- Sync with system clipboard
vim.opt.clipboard = "unnamedplus"

-- Disable netrw for Nvim-tree plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
