return {
	"williamboman/mason.nvim",
	opts = function(_, opts)
		opts.ensure_installed = opts.ensure_installed or {}
		-- python LSPs
		vim.list_extend(opts.ensure_installed, { "pyright" })
		--- JS/TS LSPs
		vim.list_extend(opts.ensure_installed, { "typescript-language-server" })
		--- JSON LSPs
		vim.list_extend(opts.ensure_installed, { "json-lsp" })
		--- YAML LSPs
		vim.list_extend(opts.ensure_installed, { "yaml-language-server", "cfn-lint" })
		--- Docker LSPs
		vim.list_extend(opts.ensure_installed, { "dockerfile-language-server" })
		--- Markdown LSPs
		vim.list_extend(opts.ensure_installed, { "markdownlint", "marksman" })
	end,
}
