--[[

  Intuitive Marks

--]]

return {
  "otavioschwanck/arrow.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  event = "VeryLazy",
  opts = {
    separate_by_branch = true,
    separate_save_and_remove = true, -- if true, will remove the toggle and create the save/remove keymaps.
    show_icons = true,
    leader_key = ';', -- Recommended to be a single key
    buffer_leader_key = ',', -- Per Buffer Mappings, dettached from regular marks
    per_buffer_config = {
      lines = 5,
    },
    index_keys = "qwfpbjluyoQWFPBJLUYO", -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by q, and 12th - by F
    mappings = {
      edit = "e",
      delete_mode = "d",
      clear_all_items = "C",
      toggle = "s", -- used as save if separate_save_and_remove is true
      open_vertical = "v",
      open_horizontal = "h",
      quit = "X",
      remove = "x", -- only used if separate_save_and_remove is true
      next_item = "]",
      prev_item = "["
    },
  }
}
