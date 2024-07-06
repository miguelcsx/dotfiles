-- lua/plugins/lualine.lua

local fn = vim.fn
local g = vim.g
local o = vim.o

return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
           options = {
              theme = "auto",
              globalstatus = true,
           },
           sections = {
              lualine_c = {},
           },
        },
        init = function()
           vim.opt.showmode = false
        end,
     },
}