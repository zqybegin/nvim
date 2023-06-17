-- if plugin isn't loaded, only return and don't report error
local status_ok, rose_pine = pcall(require, 'rose-pine')
if not status_ok then
    return
end

rose_pine.setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'moon',
})

-- Set colorscheme after options
vim.cmd('colorscheme rose-pine')
-- vim.cmd.colorscheme "catppuccin-frappe"
