return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  keys = {
    {
      "<leader>ue",
      function()
        require("edgy").toggle()
      end,
      desc = "Edgy Toggle",
    },
    -- stylua: ignore
    { "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
  },
  opts = function()
    local edgy_idx = LazyVim.plugin.extra_idx("ui.edgy")
    local symbols_idx = LazyVim.plugin.extra_idx("editor.outline")

    if edgy_idx and edgy_idx > symbols_idx then
      LazyVim.warn(
        "The `edgy.nvim` extra must be **imported** before the `outline.nvim` extra to work properly.",
        { title = "LazyVim" }
      )
    end

    local opts = {
      options = {
        left = { size = 40 },
        bottom = { size = 21 }
      },
      animate = {
        enabled = false
      },
      bottom = {
        {
          ft = "noice",
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        "Trouble",
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          -- don't open help files in edgy that we're editing
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
      },
      left = {
        {
          title = "Nvim-Tree                            ",
          ft = "NvimTree",
          pinned = true,
          open = function()
            vim.api.nvim_input("<esc><space>e")
          end,
          size = { height = 0.65  },
        },
        {
          title = "Outline                              ",
          ft = "Outline",
          pinned = true,
          open = "Outline",
        },
      },
    }
    return opts
  end,
}
