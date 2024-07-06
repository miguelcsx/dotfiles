-- lua/plugins/yanky.lua

return {
    {
    'gbprod/yanky.nvim',
    recommended = true,
    desc = 'Better Yank/Paste',
    opts = {
        highlight = {timer = 150},
    },
    keys = {
        {'<leader>p', function() require('telescope').extensions.yank_history.yank_history({}) end, desc = 'Open Yank History'},
        {'y', '<Plug>(YankyYank)', mode = {'n', 'x'}, desc = 'Yank Text'},
        {'p', '<Plug>(YankyPutAfter)', mode = {'n', 'x'}, desc = 'Put Yanked Text After Cursor'},
        {'P', '<Plug>(YankyPutBefore)', mode = {'n', 'x'}, desc = 'Put Yanked Text Before Cursor'},
    }
    }
}
