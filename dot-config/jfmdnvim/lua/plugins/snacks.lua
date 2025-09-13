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
  },
  keys = {
    { "<leader>sh", function() Snacks.picker.help() end, desc = "[H]elp Pages" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "[K]eymaps" },
    { "<leader>sf", function() Snacks.picker.files() end, desc = "[F]iles" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "[G]rep" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "[D]iagnostics" },
    { "<leader>sr", function() Snacks.picker.resume() end, desc = "[R]esume" },
    { "<leader>s.", function() Snacks.picker.recent() end, desc = "Recent [.]" },
    { "<leader>sb", function() Snacks.picker.buffers() end, desc = "[B]uffers" },
    { "<leader>st", function() Snacks.picker.git_status() end, desc = "Git S[T]atus" },
    { "<leader>ss", function() Snacks.picker.files({ cwd = vim.fn.stdpath("data") .. "/scratch" }) end, desc = "[S]cratches" },
    --
    -- -- It's also possible to pass additional configuration options.
    -- --  See `:help telescope.builtin.live_grep()` for information about particular keys
    -- vim.keymap.set("n", "<leader>s/", function()
    --   builtin.live_grep({
    --     grep_open_files = true,
    --     prompt_title = "Live Grep in Open Files",
    --   })
    -- end, { desc = "[S]earch [/] in Open Files" })
    { "<leader>s/", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers [/]" },
    --
    -- -- Shortcut for searching your Neovim configuration files
    -- vim.keymap.set("n", "<leader>sn", function()
    --   builtin.find_files({ cwd = vim.fn.stdpath("config") })
    -- end, { desc = "[S]earch [N]eovim files" })
    { "\\", function() Snacks.explorer() end, desc = "Open Explorer" }
  },
}
