-- lua/maps.lua

-- Imports
local g = vim.g
local api = vim.api
local keymap = vim.keymap.set
local map = api.nvim_set_keymap

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

-- Lsp
api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'Acciones LSP',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      keymap(mode, lhs, rhs, opts)
    end

    -- Muestra información sobre símbolo debajo del cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Saltar a definición
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Saltar a declaración
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Mostrar implementaciones
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Saltar a definición de tipo
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Listar referencias
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Mostrar argumentos de función
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renombrar símbolo
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Listar "code actions" disponibles en la posición del cursor
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Mostrar diagnósticos de la línea actual
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Saltar al diagnóstico anterior
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Saltar al siguiente diagnóstico
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})
