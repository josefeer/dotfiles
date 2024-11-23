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
    }
  }
}
