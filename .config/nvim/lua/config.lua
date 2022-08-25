-- lua/config.lua

-- Imports
local g = vim.g
local fn = vim.fn
local api = vim.api
local lsp = vim.lsp
local opt = vim.opt

-- Plugin Configurations

-- Status Line
require('lualine').setup()      -- Lua Status-line


-- File-system navigation
require('nvim-tree').setup({    -- Tree
    view = {
        width = '20%',
        mappings = {
            list = {
                { key = 's', action = 'vsplit'},
            }
        }
    },
    filters = {
        dotfiles = true,
    },
})

-- tagbar
g.tagbar_width = '25%'


-- Buffer Line
require('scope').setup()
require('bufferline').setup {   -- Buffers
    options = {
        offsets = {
            {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left',
            padding = 1
            },
            {
            filetype = 'tagbar',
            text = 'Tags',
            highlight = 'Directory',
            -- text_align = 'left'
            padding = 1
            }
        },
        show_close_icon = false,
    }
}


-- Colorschemes
require('catppuccin').setup()       -- Catppuccin colorscheme
g.catppuccin_flavour = 'mocha'      -- latte, frappe, macchiato, mocha
-- require('dracula')                  -- Dracula colorscheme
g.neon_style = 'dark'               -- Neon colorscheme style
require('onedark').setup ({          -- Onedark colorscheme
    style = 'darker'
})


-- Dev
require('impatient')                -- Auto-load plugins faster
require('nvim-autopairs').setup()   -- Auto-pair
require('gitsigns').setup()         -- Git buffers


-- Language Server
require('mason').setup({            -- Lsp package manager
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        }
    }
})
require('mason-lspconfig').setup()  -- Lsp & package manager integration

local lsp_defaults = {  -- Rules for Lsp server
    flags = {
        debounce_text_changes = 150,    -- Update rate
    },
    capabilities = require('cmp_nvim_lsp').update_capabilities(
        lsp.protocol.make_client_capabilities()
    ),
    on_attach = function(client, bufnr)
        api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
    end
}
local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
)

----
-- Servers
----
lspconfig.sumneko_lua.setup({})
lspconfig.pyright.setup({})

-- Completion
require('luasnip.loaders.from_vscode').lazy_load()

opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp', keyword_length = 3},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    formating = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end
    },
    mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<C-d>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<C-Space>'] = cmp.mapping(function(fallback)
            local col = fn.col('.') - 1
            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif col == 0 or fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, {'i', 's'}),
    },
})

-- Lint & formating
local sign = function(opts)
    fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})


vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

lsp.handlers['textDocument/hover'] = lsp.with(
  lsp.handlers.hover,
  {border = 'rounded'}
)

lsp.handlers['textDocument/signatureHelp'] = lsp.with(
  lsp.handlers.signature_help,
  {border = 'rounded'}
)

-- Syntax
require('nvim-treesitter.configs').setup({ -- Tree Sitter
    highlight = {
        enable = true,
        use_languagetree = true
    },
    indent = true
})

--api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  --group = api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  --callback = function()
    --opt.foldmethod     = 'expr'
    --opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  --end
--})
