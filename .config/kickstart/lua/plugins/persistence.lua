--[[

  Session Management

--]]

return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  keys = function ()
    local keys = {
      {
        "<leader>qu",
        function()
          require("persistence").load()
        end,
        desc = "Load c[U]rrent directory session",
      },
      {
        "<leader>qs",
        function()
          require("persistence").select()
        end,
        desc = "[S]elect session to load",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "Load [L]ast session",
      },
      {
        "<leader>qh",
        function()
          require("persistence").stop()
        end,
        desc = "[H]alt session. No save on exit",
      },
    }
    return keys
  end,
  opts = {}
}
