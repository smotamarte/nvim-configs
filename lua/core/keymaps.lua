-- lua/core/keymaps.lua

local set_keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Remap space as leader key
set_keymap('n', '<Space>', '', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- Basic mappings
set_keymap('n', '<Leader>w', ':w<CR>', default_opts) -- Save
set_keymap('n', '<Leader>q', ':q<CR>', default_opts) -- Quit
set_keymap('n', '<Leader>x', ':x<CR>', default_opts) -- Save and Quit

-- Copy and Paste Antics
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })

-- Window management
set_keymap('n', '<Leader>sv', '<C-w>v', default_opts) -- Split window vertically
set_keymap('n', '<Leader>sh', '<C-w>s', default_opts) -- Split window horizontally
set_keymap('n', '<Leader>se', '<C-w>=', default_opts) -- Equalize window sizes
set_keymap('n', '<Leader>sx', ':close<CR>', default_opts) -- Close window

-- Navigation
set_keymap('n', '<Leader>h', '<C-w>h', default_opts) -- Move to left window
set_keymap('n', '<Leader>j', '<C-w>j', default_opts) -- Move to below window
set_keymap('n', '<Leader>k', '<C-w>k', default_opts) -- Move to above window
set_keymap('n', '<Leader>l', '<C-w>l', default_opts) -- Move to right window

-- Telescope mappings
set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', default_opts) -- Find files
set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', default_opts) -- Live grep
set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', default_opts) -- List buffers
set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', default_opts) -- Help tags
