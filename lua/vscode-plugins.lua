return {
	{
		"echasnovski/mini.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			-- require('mini.completion').setup()
			vim.o.clipboard = "unnamedplus"

			require("mini.surround").setup()
		end,
	},
}
