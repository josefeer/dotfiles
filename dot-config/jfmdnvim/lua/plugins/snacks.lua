return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      enabled = true,
      animate = {
        enabled = false,
      },
    },
    picker = {},
    explorer = {
      replace_netrw = true,
    },
    image = {},
    scratch = {},
  },
  keys = {
    { "<leader>sf", function() Snacks.picker.files() end, desc = "Files" },
    { "<leader>sF", function() Snacks.picker.files({ignored = true, hidden = true}) end, desc = "Files All" },
    { "<leader>s,", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>,", function() Snacks.scratch() end, desc = "Scratch Buffer [,]" },
    { "<leader>s.", function() Snacks.picker.recent() end, desc = "Recent [.]" },
    { "<leader>s/", function() Snacks.picker.buffers() end, desc = "Buffers [/]" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "[H]elp Pages" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sG", function() Snacks.picker.grep({ignored = true, hidden = true}) end, desc = "Grep All" },
    { "<leader>sr", function() Snacks.picker.resume() end, desc = "[R]esume" },
    { "<leader>st", function() Snacks.picker.git_status() end, desc = "Git Status [t]" },
    { "<leader>sb", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers [b]" },
    -- -- Shortcut for searching your Neovim configuration files
    -- vim.keymap.set("n", "<leader>sn", function()
    --   builtin.find_files({ cwd = vim.fn.stdpath("config") })
    -- end, { desc = "[S]earch [N]eovim files" })
    { "\\", function() Snacks.explorer() end, desc = "Open Explorer" }
  },
}
