-- lua/plugins/gitsigns.lua

return {
    {
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
        },
        on_attach = function(buffer)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, {buffer = buffer, desc = desc})
            end

            map('n', ']h', function() gs.nav_hunk('next') end, 'Next Hunk')
        end,
    }
    }
}
