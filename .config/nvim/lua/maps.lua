-- lua/maps.lua

-- Imports
local g = vim.g
local keymap = vim.keymap.set
local map = vim.api.nvim_set_keymap

-- Leader
g.mapleader = ' '

-- Save & exit
map('n', '<C-s>', ':w<CR>', {noremap = true})
map('n', '<C-w>', ':q!<CR>', {noremap = true})

-- Side Bar
map('n', '<C-b>', ':NvimTreeToggle<CR>', {})  -- Toggle Sidebar

-- Tmux
local nvim_tmux_nav = require('nvim-tmux-navigation')
keymap('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateUp)
keymap('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
keymap('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
keymap('n', '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft)
