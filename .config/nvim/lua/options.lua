-- lua/vars.lua

-- Imports
local g = vim.g
local o = vim.o
local opt = vim.opt
local api = vim.api
local cmd  = vim.api.nvim_command

-- UI
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = 'yes'
o.hidden = true
o.sw = 2

-- Editing
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.breakindent = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 4
o.clipboard = 'unnamed'
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Searching
o.ignorecase = true
o.smartcase = true
o.hlsearch = false

-- Backups
o.backup = false
o.writebackup = false
o.undofile = false
o.swapfile = false

-- History
o.history = 50

-- Spliting
o.splitright = true
o.splitbelow = true

-- Folding
-- o.foldmethod = 'syntax'
-- o.foldlevelstart = 99
-- o.foldnestmax = 3
-- o.foldminlines = 1

-- Mouse
opt.mouse = 'a'

-- Theme
o.syntax = 'ON'
o.termguicolors = true
o.background = 'dark'
-- g.catppuccin_flavour = 'mocha' -- latte, frappe, macchiato, mocha
g.neon_style = 'dark'
cmd('colorscheme neon')

