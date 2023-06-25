return {
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		opts = {},
		keys = {
			{ '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Open Nvim Tree' },
		},
	},

	{
		'mrjones2014/smart-splits.nvim',
		keys = {
			-- Move the cursor
			{'<leader>wh', function() require('smart-splits').move_cursor_left() end, desc = 'Move cursor left'},
			{'<leader>wj', function() require('smart-splits').move_cursor_down() end, desc = 'Move cursor down'},
			{'<leader>wk', function() require('smart-splits').move_cursor_up() end, desc = 'Move cursor up'},
			{'<leader>wl', function() require('smart-splits').move_cursor_right() end, desc = 'Move cursor right'},

			-- Change size
			{'<C-left>', function() require('smart-splits').resize_left() end, desc = 'Resize cursor left'},
			{'<C-down>', function() require('smart-splits').resize_down() end, desc = 'Resize cursor down'},
			{'<C-up>', function() require('smart-splits').resize_up() end, desc = 'Resize cursor up'},
			{'<C-right>', function() require('smart-splits').resize_right() end, desc = 'Resize cursor right'},

			-- Move the cursor
			{'<leader>wH', function() require('smart-splits').swap_buf_left() end, desc = 'Swap cursor left'},
			{'<leader>wJ', function() require('smart-splits').swap_buf_down() end, desc = 'Swap cursor down'},
			{'<leader>wK', function() require('smart-splits').swap_buf_up() end, desc = 'Swap cursor up'},
			{'<leader>wL', function() require('smart-splits').swap_buf_right() end, desc = 'Swap cursor right'},
		}
	},

	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim' ,
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
		},
		opts={
			defaults = {
				mappings = {
					i = {
						['<C-u>'] = false,
						['<C-d>'] = false,
					},
				},
			},
		},
		config = function()
			pcall(require('telescope').load_extension, 'fzf')
		end,
		keys = {
			{
				'<leader>?',
				function()
					require('telescope.builtin').oldfiles()
				end,
				desc = '[?] Find recently opened files',
			},
			{
				'<leader><space>',
				function()
					require('telescope.builtin').buffers()
				end,
				desc = '[ ] Find existing buffers',
			},
			{
				'<leader>gf',
				function()
					require('telescope.builtin').git_files()
				end,
				desc = 'Search [G]it [F]iles',
			},
			{
				'<leader>sf',
				function()
					require('telescope.builtin').find_files()
				end,
				desc = '[S]earch [F]iles',
			},
			{
				'<leader>sh',
				function()
					require('telescope.builtin').help_tags()
				end,
				desc = '[S]earch [H]elp',
			},
			{
				'<leader>sw',
				function()
					require('telescope.builtin').grep_string()
				end,
				desc = '[S]earch current [W]ord',
			},
			{
				'<leader>sg',
				function()
					require('telescope.builtin').live_grep()
				end,
				desc = '[S]earch by [G]rep',
			},
			{
				'<leader>sd',
				function()
					require('telescope.builtin').diagnostics()
				end,
				desc = '[S]earch [D]iagnostics',
			},
		},
	},

	{
		'ThePrimeagen/harpoon',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		keys = {
			{'<leader>ha', function() require('harpoon.mark').add_file() end, desc = 'Add file to Harpoon'},
			{'<leader>ht', function() require('harpoon.ui').toggle_quick_menu() end, desc = 'Toggle quick menu'},
			{'<leader>hf', function() require('harpoon.ui').nav_file(1) end, desc = 'Go to file 1'},
			{'<leader>hg', function() require('harpoon.ui').nav_file(2) end, desc = 'Go to file 2'},
			{'<leader>hh', function() require('harpoon.ui').nav_file(3) end, desc = 'Go to file 3'},
			{'<leader>hj', function() require('harpoon.ui').nav_file(4) end, desc = 'Go to file 4'},
			{'<leader>hn', function() require('harpoon.ui').nav_next() end, desc = 'Go to next file'},
			{'<leader>hp', function() require('harpoon.ui').nav_prev() end, desc = 'Go to previous file'},
		}
	},

	{
		'phaazon/hop.nvim',
		branch = 'v2', 
		config = function()
			require('hop').setup { keys = 'asdfghjklñ' }
		end,
		keys = {
			{ 'ñ', '<cmd>HopWord<cr>', desc = 'Hop to a word' },
			{ 'Ñ', '<cmd>HopLine<cr>', desc = 'Hop to a line' },
		},
	},
}
