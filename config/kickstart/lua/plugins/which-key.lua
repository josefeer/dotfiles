--[[

  Useful plugin to show you pending keybinds.

--]]

local fallbacks = require("../fallbacks")

return {
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  opts = {
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or fallbacks.which_key_icons
    },

    -- Document existing key chains
    spec = {
      { "<leader>c", group = "[C]ode", mode = { "n", "x" }, icon = "" },
      { "<leader>s", group = "[S]earch", icon = ""},
      { "<leader>t", group = "[T]oggle", icon = "" },
      { "<leader>g", group = "[G]it", icon = "", mode = { "n", "v" } },
    },
  },
}
