return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  event = "User AstroFile",
  cmd = { "TodoQuickFix" },
  keys = {
    { "<leader>fT", "<cmd>TodoTelescope<cr>", desc = "Find Todo's" },
  }
}
