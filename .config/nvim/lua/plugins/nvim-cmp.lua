-- lua/plugins/nvim-cmp.lua

return {
    {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        {'l3mon4d3/luasnip'}
    },
    config = function()
        local lsp_zero  = require('lsp-zero')
        lsp_zero.extend_cmp()

        local cmp = require('cmp')
        local cmp_action = lsp_zero.cmp_action()

        cmp.setup({
            formatting = lsp_zero.cmp_format({details = true}),
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({select = true}),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            }
        })
    end
    }
}
