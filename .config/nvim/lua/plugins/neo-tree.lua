-- lua/plugins/neo-tree.lua

return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        cmd = 'Neotree',
        event = 'User EditingDirectory',
        sources = {
            'filesystem',
            'buffers',
            'git_status',
            'document_symbol',
        },
        auto_clean_after_session_restore = true,
        close_if_last_window = true,
        window = {
            position = 'float',
        },
        keys = {
            {
            '<leader>fe',
            function()
                require('neo-tree.command').execute(
                { toggle =  true, dir = vim.uv.cwd() }
                )
            end,
            desc = 'Explorer NeoTree (cwd)',
            },
        },
    }
}

