--[[

  Colorscheme

   You can easily change to a different colorscheme.
   Change the name of the colorscheme plugin below, and then
   change the command in the config to whatever the name of that colorscheme is.

   If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme

--]]

return {
  "nkxxll/ghostty-default-style-dark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("ghostty-default-style-dark").setup({})
    vim.cmd.colorscheme("ghostty-default-style-dark")
  end
}
