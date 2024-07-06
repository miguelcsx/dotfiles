-- lua/plugins/mini-pairs.lua


local g = vim.g

return {
    {
    "echasnovski/mini.pairs",
    opts = {
        mappings = {
        ['`'] = {action = 'closeopen', pair = '``', neigh_pattern = '[^\\`].', register = {cr = false} },
        }
    },
    }
}
