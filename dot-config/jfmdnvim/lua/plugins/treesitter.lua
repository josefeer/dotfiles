-- Tree-sitter parsers, highlighting, and text objects.
local languages = {
  "bash", "c", "css", "diff", "dockerfile", "go", "html", "htmldjango",
  "javascript", "jq", "json", "lua", "luadoc", "markdown", "markdown_inline",
  "python", "query", "regex", "rust", "scss", "sql", "svelte", "toml",
  "tsx", "typescript", "typst", "vim", "vimdoc", "vue", "yaml",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- The main branch must be available when filetypes are detected.
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")
      treesitter.install(languages)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("jfmdnvim-treesitter", { clear = true }),
        callback = function(event)
          local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
          if lang and vim.tbl_contains(treesitter.get_installed(), lang) then
            vim.treesitter.start(event.buf, lang)
          end
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = { max_lines = 3 },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
          selection_modes = { ["@function.outer"] = "V", ["@class.outer"] = "<c-v>" },
          include_surrounding_whitespace = true,
        },
      })
      local select = require("nvim-treesitter-textobjects.select").select_textobject
      for key, capture in pairs({
        af = "@function.outer",
        ["if"] = "@function.inner",
        ac = "@class.outer",
        ic = "@class.inner",
        as = "@local.scope",
      }) do
        vim.keymap.set({ "x", "o" }, key, function()
          select(capture, capture == "@local.scope" and "locals" or "textobjects")
        end, { desc = "Select " .. capture })
      end
    end,
  },
}
