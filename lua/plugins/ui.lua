return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				transparent_background = not vim.g.neovide,
				integrations = {
					gitsigns = true,
					mini = true,
					which_key = true,
					harpoon = true,
					hop = true,
					treesitter = true,
					fidget = true,
					cmp = true,
					nvimtree = true,
					-- telescope = true,
					telescope = {
						enabled = true,
						style = "classic",
					},
				},
				custom_highlights = function(colors)
					return {
						CmpBorder = { fg = colors.blue },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")
			wk.setup({
				window = {
					border = "rounded",
				},
			})
			wk.register({
				b = { name = "Buffer" },
				g = { name = "Git" },
				h = { name = "Harpoon" },
				l = {
					name = "Lsp",
					w = { name = "Workspace" },
				},
				r = { name = "Rust" },
				s = { name = "Search" },
				w = { name = "Window" },
			}, { prefix = "<leader>" })
		end,
	},

	{ "nvim-tree/nvim-web-devicons" },

	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		opts = {
			window = {
				blend = 0,
			},
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			local icons = {
				dap = {
					Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
					Breakpoint = " ",
					BreakpointCondition = " ",
					BreakpointRejected = { " ", "DiagnosticError" },
					LogPoint = ".>",
				},
				diagnostics = {
					Error = " ",
					Warn = " ",
					Hint = " ",
					Info = " ",
				},
				git = {
					added = " ",
					modified = " ",
					removed = " ",
				},
				kinds = {
					Array = " ",
					Boolean = " ",
					Class = " ",
					Color = " ",
					Constant = " ",
					Constructor = " ",
					Copilot = " ",
					Enum = " ",
					EnumMember = " ",
					Event = " ",
					Field = " ",
					File = " ",
					Folder = " ",
					Function = " ",
					Interface = " ",
					Key = " ",
					Keyword = " ",
					Method = " ",
					Module = " ",
					Namespace = " ",
					Null = " ",
					Number = " ",
					Object = " ",
					Operator = " ",
					Package = " ",
					Property = " ",
					Reference = " ",
					Snippet = " ",
					String = " ",
					Struct = " ",
					Text = " ",
					TypeParameter = " ",
					Unit = " ",
					Value = " ",
					Variable = " ",
				},
			}

			local fgf = function(name)
				---@type {foreground?:number}?
				local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name })
					or vim.api.nvim_get_hl_by_name(name, true)
				local fg = hl and hl.fg or hl.foreground
				return fg and { fg = string.format("#%06x", fg) }
			end

			return {
				options = {
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "alpha" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							"filetype",
							icon_only = true,
							separator = "",
							padding = {
								left = 1,
								right = 0,
							},
						},
						{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
						{
							"diagnostics",
							symbols = {
								error = icons.diagnostics.Error,
								warn = icons.diagnostics.Warn,
								info = icons.diagnostics.Info,
								hint = icons.diagnostics.Hint,
							},
						},
					},
					lualine_x = {
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
							color = fgf("Special"),
						},
						{
							"diff",
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
						},
					},
					lualine_y = {
						{
							"progress",
							separator = " ",
							padding = { left = 1, right = 0 },
						},
						{
							"location",
							padding = { left = 0, right = 1 },
						},
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				extensions = { "neo-tree", "lazy" },
			}
		end,
		-- See `:help lualine.txt`
		-- opts = {
		-- 	options = {
		-- 		icons_enabled = false,
		-- 		theme = 'catppuccin',
		-- 		component_separators = '|',
		-- 		section_separators = '',
		-- 	},
		-- },
	},
}
