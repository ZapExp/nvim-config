return {
	{
		"echasnovski/mini.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			-- require('mini.completion').setup()
			require("mini.surround").setup()
		end,
	},
}
