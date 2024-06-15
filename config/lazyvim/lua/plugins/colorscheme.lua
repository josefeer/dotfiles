return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    -- -- you can do it like this with a config function
    config = function()
      require("catppuccin").setup {
        -- configurations
        transparent_background = true,
      }
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  }
}
