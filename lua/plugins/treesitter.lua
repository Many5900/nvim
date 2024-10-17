return {
	{
	'nvim-treesitter/nvim-treesitter',
	config = function () 
		require('nvim-treesitter.configs').setup({
			-- ensure_installed = { "c", "lua", "rust", "svelte", "css", "javascript", "html", "toml", "tsx", "typescript", "vim", "vimdoc", "xml", "yaml" },
			auto_install = true,
            highlight = { enable = true },
            indent = { enable = true }, 
		})
	end
	},
	{ 'nvim-treesitter/nvim-treesitter-context', config = true }
}
