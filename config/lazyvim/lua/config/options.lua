-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.pumblend = 0 -- disabled transparency for LSP autocomplete features

vim.diagnostic.config({
  float = { border = "rounded" },
})

-- Disable Tabline on Top, we are using lualine instead
vim.opt.showtabline = 0
