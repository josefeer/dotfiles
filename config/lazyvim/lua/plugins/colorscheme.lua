return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        hl.DiagnosticVirtualTextError = { bg = "NONE", fg = "#eb7c80" }
        hl.DiagnosticVirtualTextWarn = { bg = "NONE", fg = c.warning }
        hl.DiagnosticVirtualTextInfo = { bg = "NONE", fg = c.info }
        hl.DiagnosticVirtualTextHint = { bg = "NONE", fg = c.hint }
      end,
    },
  },
}
