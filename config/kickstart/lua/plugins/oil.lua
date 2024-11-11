
--[[

  File explorer

--]]

return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  opts = {
    delete_to_trash = true,
    keymaps = {
      ["<C-h>"] = false,
      ["<C-s>"] = false,
    },
    view_options = {
      show_hidden = true
    },
  }
}
