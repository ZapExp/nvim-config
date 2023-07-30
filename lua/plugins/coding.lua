return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			require("config.lspconfig")
			require("config.rust-tools")
		end,
	},

	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"L3MON4D3/LuaSnip",
			{
				"saadparwaiz1/cmp_luasnip",
				dependencies = { "rafamadriz/friendly-snippets" },
				config = function()
					require("config.cmp")
				end,
			},
		},
	},

	--Rust specific
	{
		"simrat39/rust-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("config.null-ls")
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},

	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	},
}
