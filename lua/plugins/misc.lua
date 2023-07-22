return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("config.mini")
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require'colorizer'.setup()
		end,
		event = { "BufReadPost", "BufNewFile" },
	},

	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
		},
	},
}
