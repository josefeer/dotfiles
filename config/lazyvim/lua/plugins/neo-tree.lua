local Util = require("lazyvim.util")

return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  keys = {
    -- disable original keymaps
    { "<leader>fe", false },
    { "<leader>fE", false },
    { "<leader>ge", false },
    { "<leader>be", false },
    -- keymaps remapped
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
  },
  opts = {
    auto_clean_after_session_restore = true,
    close_if_last_window = true,
    source_selector = {
      winbar = false,
      content_layout = "center",
      sources = {
        { source = "filesystem", display_name = "󰉓 Files" },
        { source = "buffers", display_name = "󰈚 Buffers" },
        { source = "git_status", display_name = " Git" },
      },
    },
    default_component_configs = {
      indent = { padding = 0 },
    },
    window = {
      width = 45,
    },
  },
}
