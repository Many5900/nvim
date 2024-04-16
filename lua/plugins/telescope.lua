return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
        {
            "madsludvig/telescope-stregsystem",
            dependencies = {
                "rcarriga/nvim-notify",
            },
        },
    },

    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        
    
        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        -- ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
                        -- ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
                    },
                },
            },
            extensions = {
                ["stregsystem"] = {
                    username = "brew",
                },
            },
        })
    
        telescope.load_extension("fzf")
        
        -- set keymaps
        local keymap = vim.keymap

        -- keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep search_dirs=~/code<cr>", { desc = "Fuzzy find files in cwd" })

        -- keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args({cwd = '~/code'})<CR>")


        keymap.set("n", "<leader>sg", function() require("telescope.builtin").live_grep() end, { desc = "[S]earch by [G]rep" })
        keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
        keymap.set("n", "<leader>.", "<cmd>Telescope stregsystem<CR>", { desc = "[.]Stregsystem" })
    end,
}
