--[[

  Status Bar

--]]

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      disabled_filetypes = {'neo-tree', ''},
    },
    sections = {
      lualine_x = {"encoding", "filesize", "filetype"},
      lualine_y = {"progress", "location"},
      lualine_z = {"tabs"},
    },
  },
}
