-- Extra text objects
require('mini.ai').setup()

-- Animations
require('mini.animate').setup()

-- Basic options
require('mini.basics').setup({
  -- Options. Set to `false` to disable.
  options = {
    -- Basic options ('termguicolors', 'number', 'ignorecase', and many more)
    basic = false,

    -- Extra UI features ('winblend', 'cmdheight=0', ...)
    extra_ui = false,

    -- Presets for window borders ('single', 'double', ...)
    win_borders = 'default',
  },

  -- Mappings. Set to `false` to disable.
  mappings = {
    -- Basic mappings (better 'jk', save with Ctrl+S, ...)
    basic = true,

    -- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
    -- Supply empty string to not create these mappings.
    option_toggle_prefix = [[\]],

    -- Window navigation with <C-hjkl>, resize with <C-arrow>
    windows = false,

    -- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
    move_with_alt = true,
  },

  -- Autocommands. Set to `false` to disable
  autocommands = {
    -- Basic autocommands (highlight on yank, start Insert in terminal, ...)
    basic = true,

    -- Set 'relativenumber' only in linewise and blockwise Visual mode
    relnum_in_visual_mode = false,
  },

  -- Whether to disable showing non-error feedback
  silent = false,
})

require('mini.bufremove').setup()
vim.keymap.set('n', '<leader>bd', [[<cmd>lua require("mini.bufremove").delete(0, false)<CR>]], { desc = 'Delete Buffer' })
vim.keymap.set('n', '<leader>bD', [[<cmd>lua require("mini.bufremove").delete(0, true)<CR>]], { desc = 'Delete Buffer (Force)' })

-- Comment things
require('mini.comment').setup({
    -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Toggle comment (like `gcip` - comment inner paragraph) for both
    -- Normal and Visual modes
    comment = '',

    -- Toggle comment on current line
    comment_line = '<leader>/',

    -- Define 'comment' textobject (like `dgc` - delete whole comment block)
    textobject = '',
  },
})

-- Underline in current word
require('mini.cursorword').setup()

-- Add color for hex color codes
require('mini.hipatterns').setup()

-- Better f, F, t, T movements
require('mini.jump').setup()

-- Move text lines with M-h, j, k, l
require('mini.move').setup()

-- Automatic pair closing
require('mini.pairs').setup()

-- Split or joins {}, [] or () contents
require('mini.splitjoin').setup()

-- Surround tool
require('mini.surround').setup()
