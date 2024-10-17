return {
    {
      "olimorris/onedarkpro.nvim",
      lazy = false,
      enabled = true,
      config = function()
        require('onedarkpro').setup  {
            -- Main options --
            vim.cmd("colorscheme onedark_dark")
            
        }
      end,
    },
}