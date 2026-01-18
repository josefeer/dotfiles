--[[

  Status Bar

--]]

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "everforest",
      globalstatus = 3, -- single status bar for all buffers
    },
    sections = {
      lualine_c = {{"filename", path=1}}, -- display relative path of file
      lualine_x = {"encoding", "filesize", "filetype"},
      lualine_y = {"progress", "location"},
      lualine_z = {"tabs"},
    },
  },
}
