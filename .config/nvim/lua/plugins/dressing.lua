-- lua/plugins/dressing.lua

local ui = vim.ui

return {
    {
    'stevearc/dressing.nvim',
    lazy = true,
    init = function()
        --@diagnostic disable-next-line: duplicate-set-field
        ui.select  = function(...)
            require('lazy').load({plugins = {'dressing.nvim'}})
            return ui.select(...)
        end
        --
        ui.input = function(...)
            require('lazy').load({plugins = {'dressing.nvim'}})
            return ui.input(...)
        end
    end,
    }
}
