-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "gL", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	-- -- Enable completion triggered by <c-x><c-o>
	-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })

	-- Lsp functionality
	nmap("<leader>lr", vim.lsp.buf.rename, "[R]ename")
	nmap("<leader>la", vim.lsp.buf.code_action, "Code [A]ction")
	nmap("<leader>ld", require("telescope.builtin").lsp_document_symbols, "Document [S]ymbols")
	nmap("<leader>lf", "<cmd>Format<cr>", "[F]ormat current buffer")

	-- Lesser used LSP functionality
	nmap("<leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
	nmap("<leader>lwa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>lwr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>lwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Goto functionality
	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("gt", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("L", vim.lsp.buf.signature_help, "Signature Documentation")
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
	-- clangd = {},
	-- gopls = {},
	-- rust_analyzer = {},
	-- pylsp = {},
	-- hls = {},
	cssls = {},
	html = {},
	pyright = {},
	tsserver = {},
	svelte = {},
	tailwindcss = {},
	emmet_ls = {},
	prismals = {},
	jsonls = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

-- Setup neovim lua configuration
require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
require("mason").setup({
	ui = {
		border = "rounded",
	},
})
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})

local manual_list = {
	-- 	"cssls",
	-- 	"html",
	-- 	"hls"
}

local lspconfig = require("lspconfig")

for _, language in ipairs(manual_list) do
	lspconfig[language].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

-- lspconfig.lua_ls.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	settings = {
-- 		Lua = {
-- 			workspace = { checkThirdParty = false },
-- 			telemetry = { enable = false },
-- 		},
-- 	}
-- })

-- setup rust
local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = on_attach,
	},
})
