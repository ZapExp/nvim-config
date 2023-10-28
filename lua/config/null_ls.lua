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
local format = require("null-ls").builtins.formatting

null_ls.setup({
	sources = {
		format.stylua,
		format.prettierd.with({
			extra_args = {
				-- "--single-attribute-per-line",
			},
		}),
		format.rustywind,
		format.rustfmt,
		format.black,
		format.ocamlformat,
	},
})

