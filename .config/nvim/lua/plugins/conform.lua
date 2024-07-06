-- lua/plugins/conform.lua

return {
    {
    'stevearc/conform.nvim',
    optional = true,
    opts = {
        formatters_by_ft = {
            ["javascript"] = { "dprint", { "prettierd", "prettier" } },
            ["javascriptreact"] = { "dprint" },
            ["typescript"] = { "dprint", { "prettierd", "prettier" } },
            ["typescriptreact"] = { "dprint" },
        }
    }
    }
}
