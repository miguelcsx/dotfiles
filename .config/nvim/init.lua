-- init.lua

if vim.loader then
    vim.loader.enable()
end

require('config.options')   -- Settings
require('config.mappings')  -- Keymaps
require('config.autocmds')  -- Autocmds
-- require('config.utils')     -- Utils
require('config.lazy')      -- Lazy

vim.cmd('colorscheme carbonfox')
