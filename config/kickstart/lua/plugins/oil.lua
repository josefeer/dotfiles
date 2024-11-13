
--[[

  File explorer

--]]

return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  opts = {
    delete_to_trash = true,
    keymaps = {
      ["<C-h>"] = {"<C-w><C-h>", desc = "Move focus to the left window"},
      ["<C-l>"] = {"<C-w><C-l>", desc = "Move focus to the right window"},
      ["<C-j>"] = {"<C-w><C-j>", desc = "Move focus to the lower window"},
      ["<C-k>"] = {"<C-w><C-h>", desc = "Move focus to the upper window"},
      ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
      ["<C-x>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
      ["<C-r>"] = "actions.refresh",
      ["<C-s>"] = false,
    },
    view_options = {
      show_hidden = true
    },
  }
}
