-- lua/plugins/which-key.lua

return {
    {
    'folke/which-key.nvim',
    opts = function(_, opts)
    -- set map with noice
        if pcall(require, 'noice.nvim') then
            opts.defaults['<leader>sn'] = {name = '+noice'}
        end
    end,
    }
}
