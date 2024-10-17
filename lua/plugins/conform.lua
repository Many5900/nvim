return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                rust = { "rustfmt", lsp_format = "fallback" },
            },
            format_on_save = {
                -- Enable format on save for Rust files
                rust = true,
                
                -- lsp_fallback = true,             -- Format-on-save for all file types
            },
        })

        vim.keymap.set('n', '<leader>gf', function()
            require('conform').format({ async = true })
        end, { noremap = true, silent = true, desc = 'Format Code' })
    end
}