return {
  "folke/edgy.nvim",
  event = "VeryLazy",
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
        bottom = { size = 20 }
      },
      animate = {
        enabled = false
      },
      bottom = {
        {
          ft = "noice",
          size = { height = 0.4 },
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        -- {
        --   ft = "lazyterm",
        --   title = "LazyTerm",
        --   size = { height = 0.4 },
        --   filter = function(buf)
        --     return not vim.b[buf].lazyterm_cmd
        --   end,
        -- },
        "Trouble",
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          size = { height = 20 },
          -- don't open help files in edgy that we're editing
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
        -- { title = "Spectre", ft = "spectre_panel", size = { height = 0.4 } },
        -- { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
      },
      left = {
        {
          title = "Nvim-Tree",
          ft = "NvimTree",
          pinned = true,
          open = function()
            vim.api.nvim_input("<esc><space>e")
          end,
          size = { height = 0.65  },
        },
        -- { title = "Neotest Summary", ft = "neotest-summary" },
        -- {
        --   title = "Neo-Tree Git",
        --   ft = "neo-tree",
        --   filter = function(buf)
        --     return vim.b[buf].neo_tree_source == "git_status"
        --   end,
        --   pinned = true,
        --   open = "Neotree position=right git_status",
        -- },
        -- {
        --   title = "Neo-Tree Buffers",
        --   ft = "neo-tree",
        --   filter = function(buf)
        --     return vim.b[buf].neo_tree_source == "buffers"
        --   end,
        --   pinned = true,
        --   open = "Neotree position=top buffers",
        -- },
        {
          title = "Outline",
          ft = "Outline",
          pinned = true,
          open = "Outline",
        },
      },
      keys = {
        -- increase width
        ["<c-Right>"] = function(win)
          win:resize("width", 2)
        end,
        -- decrease width
        ["<c-Left>"] = function(win)
          win:resize("width", -2)
        end,
        -- increase height
        ["<c-Up>"] = function(win)
          win:resize("height", 2)
        end,
        -- decrease height
        ["<c-Down>"] = function(win)
          win:resize("height", -2)
        end,
      },
    }
    return opts
  end,
}
