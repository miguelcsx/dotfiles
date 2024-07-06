-- lua/plugins/nvim-treesitter.lua

return {
    {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ':TSUpdate',
    event = { 'VeryLazy' },
    -- load treesitter early when opening a file from the cmdline
    lazy = vim.fn.argc(-1) == 0,
    init = function(plugin)
        require('lazy.core.loader').add_to_rtp(plugin)
        require('nvim-treesitter.query_predicates')
    end,
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TsInstall'},
    keys = {
        {'<c-space>', desc = 'Increment Selection'},
        {'<bs>', desc = 'Decrement Selection', mode = 'x'},
    },
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        highlight = {
            enable = true,
            use_languagetree = true,
        },
        indent = {
            enable = true,
        }
    }
    }
}
