return {
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPost', 'BufNewFile' },
		dependencies = {
			{
				-- Autocompletion
				'hrsh7th/nvim-cmp',
				event = { 'BufReadPost', 'BufNewFile' },
				dependencies = {
					'hrsh7th/cmp-nvim-lsp',
					'hrsh7th/cmp-path',
					'hrsh7th/cmp-buffer',
					'hrsh7th/cmp-nvim-lsp-signature-help',
					'L3MON4D3/LuaSnip',
					{
						'saadparwaiz1/cmp_luasnip',
						dependencies = { 'rafamadriz/friendly-snippets' },
						config = function()
							require 'config.cmp'
						end,
					},
				},
			},
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',
			'folke/neodev.nvim',
		},
		config = function()
			require 'config.lspconfig'
		end,
	},

	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		event = { 'BufReadPost', 'BufNewFile' },
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = { 'lua', 'tsx', 'typescript', 'javascript', 'svelte', 'html', 'css', 'vimdoc', 'vim' },
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true, disable = { 'python' } },
			})
		end,
	},

}
