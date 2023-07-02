-- local mason_lspconfig = require 'mason-lspconfig'
--
-- mason_lspconfig.setup {
-- 	ensure_installed = {
-- 		'stylua',
-- 		'prettierd',
-- 		'rustywind',
-- 		'sql-formatter'
-- 	}
-- }

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd.with({
			extra_args = {
				"--single-attribute-per-line",
			},
		}),
		null_ls.builtins.formatting.rustywind,
	},
})
