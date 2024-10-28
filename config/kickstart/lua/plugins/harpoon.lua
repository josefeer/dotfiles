
--[[

  Intuitive Marks

--]]

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = function()
    local keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        desc = "[H]arpoon [A]dd to List",
      },
      {
        "<leader>hl",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "[H]arpoon [L]ist",
      },
      {
        "<leader>hq",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "[H]arpoon File 1",
      },
      {
        "<leader>hw",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "[H]arpoon File 2",
      },
      {
        "<leader>hf",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "[H]arpoon File 3",
      },
      {
        "<leader>hp",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "[H]arpoon File 4",
      },
      {
        "<leader>hb",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "[H]arpoon File 5",
      },
    }
    return keys
  end,
}
