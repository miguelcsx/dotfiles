-- lua/maps.lua

-- Imports
local g = vim.g
local api = vim.api
local map = api.nvim_set_keymap
local keymap = vim.keymap.set

-- Leader
g.mapleader = ' '

-- Save & exit
map('n', '<C-s>', ':w<CR>', {noremap = true})       -- Save file
map('n', '<C-q>', ':q!<CR>', {noremap = true})      -- Exit without saving
map('n', '<leader>bd', ':bd<CR>', {noremap = true}) -- Buffer delete

-- Side Bar
map('n', '<C-b>', ':NvimTreeToggle<CR>', {})  -- Toggle Tree
map('n', '<A-b>', ':TagbarToggle<CR>', {}) -- Toggle Tags

-- BufferLine
map('n', '<S-h>', ':BufferLineCycleNext<CR>', {})   -- Next buffer
map('n', '<S-l>', ':BufferLineCloseLeft<CR>', {})   -- Close prev buffer

-- Terminal
map('n', '<C-t>', ':split<CR>:terminal<CR>:resize 10<CR>', {})  -- Split terminal

-- Tmux
local nvim_tmux_nav = require('nvim-tmux-navigation')
keymap('n', "<leader> <C-j>", nvim_tmux_nav.NvimTmuxNavigateUp)
keymap('n', "<leader> <C-k>", nvim_tmux_nav.NvimTmuxNavigateDown)
keymap('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
keymap('n', '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft)

-- Lsp
-- Info under cursor
map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', {})
-- Go to definition
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', {})
-- Go to declaration
map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', {})
-- Show implementation
map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', {})
-- Go to type definition
map('n', 'go', ':lua vim.lsp.buf.type_definition()<CR>', {})
-- List references
map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', {})
-- Show function args
map('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>', {})
-- Rename symbol
map('n', '<F2>', ':lua vim.lsp.buf.rename()<CR>', {})
-- List avaliable "code actions"
map('n', '<F4>', ':lua vim.lsp.buf.code_action()<CR>', {})
map('x', '<F4>', ':lua vim.lsp.buf.range_code_action()<CR>', {})
-- Show diagnostic under cursor
map('n', 'gl', ':lua vim.diagnostic.open_float()<CR>', {})
-- Go to prev diagnostic
map('n', '[d', ':lua vim.diagnostic.goto_prev()<CR>', {})
-- Go to next diagnostic
map('n', ']d', ':lua vim.diagnostic.goto_next()<CR>', {})

-- Telescope
map('n', '<C-g>', ':Telescope<CR>', {})             -- Open Telescope
map('n', '<C-f>', ':Telescope find_files<CR>', {})  -- Search files
map('n', 'fb', ':Telescope buffers<CR>', {})        -- Show buffers

