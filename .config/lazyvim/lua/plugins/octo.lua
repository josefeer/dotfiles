return {
  "pwntester/octo.nvim",
  cmd = "Octo",
  event = { { event = "BufReadCmd", pattern = "octo://*" } },
  opts = {
    enable_builtin = false,
    mappings_disable_default = true,
    default_to_projects_v2 = false,
    default_merge_method = "commit",
    picker = "telescope",
    suppress_missing_scope = {
      projects_v2 = true,
    }
  },
  keys = {
    { "@", "@<C-x><C-o>", mode = "i", ft = "octo", silent = true },
    { "#", "#<C-x><C-o>", mode = "i", ft = "octo", silent = true },
  },
}
