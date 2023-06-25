-- Save with Ctrl+s
vim.keymap.set('n', '<C-s>', ':w<cr>')

-- Remove highlight of search with Esc
vim.keymap.set('n', '<Esc>', ':noh<CR>')

-- Better J in normal
vim.keymap.set('n', 'J', 'mmJ`m', { noremap = true })

-- Buffers
vim.keymap.set('n', '<leader>|', '<cmd>vsplit<CR>', { desc = 'Split buffer vertically' })
vim.keymap.set('n', '<leader>\\', '<cmd>split<CR>', { desc = 'Split buffer horizontally' })

-- Centered movements
-- vim.keymap.set('n', '<C-u>', '<C-u>zz0')
-- vim.keymap.set('n', '<C-d>', '<C-d>zz0')
-- vim.keymap.set('n', '{', '{zz0')
-- vim.keymap.set('n', '}', '}zz0')
-- vim.keymap.set('n', 'n', 'nzzzv')
-- vim.keymap.set('n', 'N', 'Nzzzv')
