-- lua/plugins/nvim-notify.lua

local api = vim.api
local o = vim.o


return {
    {
    'rcarriga/nvim-notify',
    keys = {
        {
        '<leader>un',
        function()
            require('notify').dismiss({silent=true, pending=true})
        end,
        desc = 'Dismiss All Notifications',
        },
    },
    opts = {
        stages = 'static',
        timeout = 3000,
        max_height = function()
            return math.floor(o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(o.columns * 0.75)
        end,
        on_open = function(win)
            api.nvim_win_set_config(win, {zindex = 100})
        end,
    },
    }
}
