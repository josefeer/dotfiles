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
  },
  keys = {
    -- vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    { "<leader>sh", function() Snacks.picker.help() end, desc = "[H]elp Pages" },
    -- vim.keymap.set("n", "<leader>si", function() builtin.find_files({hidden=true}) end , { desc = "[S]earch H[I]dden Files" })
    -- vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "[K]eymaps" },
    -- vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
    { "<leader>sf", function() Snacks.picker.files() end, desc = "[F]iles" },
    -- vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    -- vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    -- vim.keymap.set("n", "<leader>sg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = "[S]earch by [G]rep" })
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "[G]rep" },
    -- vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "[D]iagnostics" },
    -- vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    { "<leader>sr", function() Snacks.picker.resume() end, desc = "[R]esume" },
    -- vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    { "<leader>s.", function() Snacks.picker.recent() end, desc = "Recent [.]" },
    -- vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch existing [B]uffers" })
    { "<leader>sb", function() Snacks.picker.buffers() end, desc = "[B]uffers" },
    -- vim.keymap.set("n", "<leader>st", "<cmd>Telescope git_status<CR>", { desc = "[S]earch git s[T]atus" })
    { "<leader>st", function() Snacks.picker.git_status() end, desc = "Git S[T]atus" },
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
