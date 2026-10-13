return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "prettier", "ruff", "stylua" },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    opts = {
      formatters = {
        ruff_format = {
          command = function(self, ctx)
            local find = require("conform.util").find_executable({ ".venv/bin/ruff", "venv/bin/ruff" }, "ruff")
            return find(self, ctx)
          end,
        },
      },
      formatters_by_ft = {
        python = { "ruff_format" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        lua = { "stylua" },
        go = { "gofmt" },
        rust = { "rustfmt" },
      },
      format_on_save = function()
        if vim.g.disable_autoformat then
          return
        end
        return { timeout_ms = 2000, lsp_format = "fallback" }
      end,
    },
    keys = {
      {
        "<leader>af",
        function()
          vim.g.disable_autoformat = not vim.g.disable_autoformat
          vim.notify("Format on save " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
        end,
        desc = "Toggle format on save",
      },
      {
        "<leader>aF",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        desc = "Format buffer now",
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
