require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'moon',
})

-- Set colorscheme after options
vim.cmd('colorscheme rose-pine')
-- vim.cmd.colorscheme "catppuccin-frappe"
