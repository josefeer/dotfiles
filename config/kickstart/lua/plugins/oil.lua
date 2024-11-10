
--[[

  File explorer

--]]

return {
  "stevearc/oil.nvim",
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
