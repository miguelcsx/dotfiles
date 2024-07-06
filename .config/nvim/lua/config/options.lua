-- lua/settings.lua

local o  = vim.o
local g = vim.g

-- UI
o.sw = 2
o.number = true
o.hidden = true
o.numberwidth = 2
o.relativenumber = true
g.tagbar_width = '25%'

-- Editing
o.tabstop = 4
o.list = true
o.wrap = true
o.shiftwidth = 4
o.cindent = true
o.textwidth = 300
o.smarttab = true
o.expandtab = true
o.autoindent = true
o.breakindent = true
o.clipboard = 'unnamedplus'
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Searching
o.smartcase = true
o.hlsearch = false
o.ignorecase = true

-- Backups
o.backup = false
o.undofile = false
o.swapfile = false
o.writebackup = false

-- History
o.history = 100

-- Splitting
o.splitbelow = true
o.splitright = true

-- Mouse
o.mouse = 'a'

-- Theme
o.syntax = 'on'
o.termguicolors = true
o.background = 'dark'

vim.diagnostic.config({virtual_text = false})
