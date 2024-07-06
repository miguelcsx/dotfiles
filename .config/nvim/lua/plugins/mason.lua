-- lua/plugins/mason.lua

return {
    {
    'williamboman/mason.nvim',
    lazy = false,
    cmd = 'Mason',
    keys = {
        {
        '<leader>cm',
        '<cmd>Mason<cr>',
        desc = 'Mason',
        }
    },
    build = ':MasonUpdate',
    opts = {},
    config = true,
    },
}
