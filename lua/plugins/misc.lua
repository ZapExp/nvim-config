return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require 'config.mini'
    end,
  },

	{
		'kdheepak/lazygit.nvim',
		keys = {
			{ '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Open LazyGit' },
		},
	},
}
