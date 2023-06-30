vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- copy to system clipborad
vim.opt.clipboard = "unnamedplus"

-- set '-' '<' '>' as a letter
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set iskeyword+=<]]
vim.cmd [[set iskeyword+=>]]

-- disable netrw's gx mapping
vim.g.netrw_nogx = 1

-- Open help window in a vertical split to the right.
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = vim.api.nvim_create_augroup("help_window_right", {}),
    pattern = { "*" },
    callback = function()
        if vim.o.filetype == 'help' or vim.o.filetype == 'man' then vim.cmd.wincmd("L") end
    end
})

-- use simple way to use lsp formatting
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
