-- lua/maps.lua

local g = vim.g

local function map(mode, lhs, rhs, opts)
    -- set default value if not specify
    if opts.noremap == nil then
        opts.noremap = true
    end
    if opts.silent == nil then
        opts.silent = true
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

g.mapleader = ' '
g.maplocalleader = ' '

-- Better window movement
map('n', '<C-h>', '<C-w>h', { silent = true })
