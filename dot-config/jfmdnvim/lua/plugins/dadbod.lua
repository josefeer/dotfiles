return {
  {
    "tpope/vim-dadbod",
    cmd = { "DB", "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod" },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    keys = {
      { "<leader>du", "<cmd>DBUIToggle<cr>", desc = "DB UI toggle" },
      { "<leader>df", "<cmd>DBUIFindBuffer<cr>", desc = "DB UI find buffer" },
      { "<leader>dr", "<cmd>DBUIRenameBuffer<cr>", desc = "DB UI rename buffer" },
      { "<leader>dl", "<cmd>DBUILastQueryInfo<cr>", desc = "DB UI last query info" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_help = 0
    end,
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = { "tpope/vim-dadbod" },
    ft = { "sql", "mysql", "plsql" },
    config = function()
      -- Enable omni completion + nvim-cmp source when editing SQL
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          vim.cmd([[setlocal omnifunc=vim_dadbod_completion#omni]])
          local ok, cmp = pcall(require, "cmp")
          if ok then
            cmp.setup.buffer({
              sources = vim.tbl_extend("force",
                cmp.get_config().sources or {},
                { { name = "vim-dadbod-completion" } }
              ),
            })
          end
        end,
      })
    end,
  },
  -- If you use nvim-cmp via Lazy, this augments its sources safely.
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      opts = opts or {}
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "vim-dadbod-completion" })
      return opts
    end,
  },
}
