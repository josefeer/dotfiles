-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  -- tables with the `name` key will be registered with which-key if it's installed
  -- this is useful for naming menus
  n = {
    -- Tabs
    ["<leader>T"] = { name = "Tabs" },
    ["<leader>Tn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>Tc"] = { "<cmd>tabclose<cr>", desc = "Close tab" },

    --- Buffers
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>be"] = { "<cmd>echo expand('%:p')<cr>", desc = "Where is this buffer?" },
    ["<S-l>"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["<S-h>"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },
    ["<leader>c"] = {
        function()
          local bufs = vim.fn.getbufinfo { buflisted = true }
          require("astronvim.utils.buffer").close()
          if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
        end,
        desc = "Close buffer",
    },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- greatest remap ever (according to the primegen)
    -- ["<leader>p"] = { "<cmd>_dP<cr>", desc = "Real Copy Paste" },

    -- more primegen remaps
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },

    -- Mine
    ["<leader>Q"] = { "<cmd>qa!<cr>", desc = "Quit All" },

    -- Marks
    ["<leader>m"] = { name = "Marks" },
    ["<leader>mD"] = { "<cmd>delm! | delm A-Z0-9 | wshada!<cr>", desc = "Delete all marks" },
  },
  t = {
    ["<C-l>"] = {"<cmd>TermExec cmd='clear'<cr>", desc = "Clear ToggleTerm Terminal"}
  },
}
