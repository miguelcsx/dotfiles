-- init.lua


-- Nvim config with lua

local g = vim.g

-- Lua Imports
require('maps')
require('plugins')
require('options')


-- Leader
g.mapleader = ''
g.localleader = ''

-- Import PLugins
require('impatient')                -- Auto-load plugins
require('nvim-autopairs').setup()   -- Auto-pair
require('catppuccin').setup()       -- Catppuccin colorscheme
require('nvim-tree').setup()        -- File-system tree
require('lualine').setup()          -- Lua Status-line
require('onedark').setup {          -- Onedark colorscheme
    style = 'darker'
}
