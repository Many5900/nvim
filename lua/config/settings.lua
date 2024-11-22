-- ************************************* --
-- ********** SYSTEM SETTINGS ********** --
-- ************************************* --
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.number = true -- Enable absolute line number for the current line
vim.opt.scrolloff = 12 -- Scroll offset
-- vim.opt.tabstop = 2                     -- Tabsize
-- vim.opt.textwidth = 80                  -- Automatically wrap text at 80 characters

-- Set tab size to 4 spaces
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use spaces instead of tabs
