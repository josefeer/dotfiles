return {
	"nvim-treesitter/nvim-treesitter",
	opts = function(_, opts)
		if type(opts.ensure_installed) == "table" then
			-- python parsers
			vim.list_extend(opts.ensure_installed, { "ninja", "python", "toml" })
			--- JS/TS parsers
			vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
			--- JSON parsers
			vim.list_extend(opts.ensure_installed, { "json", "json5", "jsonc" })
			--- YAML parsers
			vim.list_extend(opts.ensure_installed, { "yaml" })
			--- Docker parsers
			vim.list_extend(opts.ensure_installed, { "dockerfile" })
			--- Markdown parsers
			vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
		end
	end,
}
