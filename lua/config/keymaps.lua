vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- ******************************* --
-- ********** TELESCOPE ********** --
-- ******************************* --
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })



-- ************************* --
-- ********** LSP ********** --
-- ************************* --
vim.keymap.set("n", "gd", telescope.lsp_definitions, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
vim.keymap.set("n", "gr", telescope.lsp_references, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "gI", telescope.lsp_implementations, { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "<leader>ss", telescope.lsp_document_symbols, { desc = "[S]earch Document [S]ymbols" })
vim.keymap.set("n", "<leader>sS", telescope.lsp_dynamic_workspace_symbols, { desc = "[S]earch Workspace [S]ymbols" })

-- vim.keymap.set("n", "<leader>D", telescope.lsp_type_definitions, { desc = "Type [D]efinition" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })



-- ********************************** --
-- ********** INLINE HINTS ********** --
-- ********************************** --
-- Initialize a variable to keep track of the current state of inline hints
local inline_hints_enabled = false

-- Define the toggle function
local function toggle_inline_hints()
  inline_hints_enabled = not inline_hints_enabled
  vim.lsp.inlay_hint.enable(inline_hints_enabled, { 0 })
  if inline_hints_enabled then
    vim.notify("Inline Hints Enabled", vim.log.levels.INFO)
  else
    vim.notify("Inline Hints Disabled", vim.log.levels.INFO)
  end
end

-- Map the toggle function to <leader>h
vim.keymap.set("n", "<leader>h", toggle_inline_hints, { noremap = true, silent = true, desc = "Toggle Inline Hints" })