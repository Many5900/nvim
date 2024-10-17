return {
    {
      "goolord/alpha-nvim",
      opts = function()
        local dashboard = require("alpha.themes.dashboard")
  
        dashboard.config.opts.margin = 0
        dashboard.section.header.opts.hl = "String"
  
        local headerblock = {
          "",
          "",
          "",
          "",
          "",
          "",
          "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
          "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
          "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
          "▒   ▒   ▒▒▒   ▒▒▒▒▒   ▒▒▒▒▒    ▒   ▒   ▒▒▒",
          "▓▓   ▓▓   ▓▓   ▓▓▓   ▓▓   ▓▓   ▓▓  ▓▓   ▒▒",
          "▓▓   ▓▓   ▓▓▓   ▓   ▓▓▓   ▓▓   ▓▓  ▓▓   ▓▓",
          "▓▓   ▓▓   ▓▓▓▓     ▓▓▓▓   ▓▓   ▓▓  ▓▓   ▓▓",
          "█    ██   █████   █████   █    ██  ██   ██",
          "██████████████████████████████████████████",
        }
  
        local header_colossal = {
          [[]],
          [[]],
          [[]],
          [[]],
          [[]],
          [[]],
          [[███╗   ███╗ █████╗ ███╗   ██╗██╗   ██╗███████╗ ██████╗  ██████╗  ██████╗ ]],
          [[████╗ ████║██╔══██╗████╗  ██║╚██╗ ██╔╝██╔════╝██╔═══██╗██╔═████╗██╔═████╗]],
          [[██╔████╔██║███████║██╔██╗ ██║ ╚████╔╝ ███████╗████████║██║██╔██║██║██╔██║]],
          [[██║╚██╔╝██║██╔══██║██║╚██╗██║  ╚██╔╝  ╚════██║╚════██╔╝████╔╝██║████╔╝██║]],
          [[██║ ╚═╝ ██║██║  ██║██║ ╚████║   ██║   ███████║ █████╔╝ ╚██████╔╝╚██████╔╝]],
          [[╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝ ╚════╝   ╚═════╝  ╚═════╝ ]],
          [[]],
        }
  
        
        
  
        -- Set header
        dashboard.section.header.val = header_colossal
        dashboard.section.header.opts.hl = "PreProc"
  
        -- Set menu
        dashboard.section.buttons.val = {
          dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
          dashboard.button("n", "  New file", ":ene | startinsert <CR>"),
          dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
          dashboard.button("g", "  Find text", ":Telescope live_grep <CR>"),
          dashboard.button(
            "c",
            "  Config",
            [[:lua require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })<CR>]]
          ),
          dashboard.button("s", "  Restore Session", ':lua require("persistence").load() <CR>'),
          dashboard.button("l", "󰒲  Lazy", ":Lazy <CR>"),
          dashboard.button("q", "  Quit", ":qa <CR>"),
        }
        return dashboard
      end,
      config = function(_, dashboard)
        local alpha = require("alpha")
        vim.api.nvim_create_autocmd("User", {
          callback = function()
            local stats = require("lazy").stats()
            local ms = math.floor(stats.startuptime * 100) / 100
            dashboard.section.footer.val = "󱐌 Lazy-loaded "
              .. stats.loaded
              .. "/"
              .. stats.count
              .. " plugins in "
              .. ms
              .. "ms"
            pcall(vim.cmd.AlphaRedraw)
          end,
        })
  
        alpha.setup(dashboard.opts)
      end,
    },
  }
  