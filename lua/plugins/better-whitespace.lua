local M = {
    "ntpeters/vim-better-whitespace",  -- better handling of whitespace characters
    event = { "BufRead", "BufNewFile" },
}

function M.config()
    -- the color of Whitespace highlighting
    vim.cmd [[highlight ExtraWhitespace guibg='#61AFEF']]

    -- enable highlighting and stripping whitespace on save by default
    vim.g.better_whitespace_enabled = 1

    -- bug :https://github.com/ntpeters/vim-better-whitespace/issues/127
    -- vim.g.strip_whitespace_on_save = 1
    vim.cmd("autocmd BufWritePre * :StripWhitespace")

    -- disable automatically stripping whitespace for large files,
    vim.g.strip_max_file_size = 1000

    -- don't be asked for confirmation before whitespace is stripped when you save the file
    vim.g.strip_whitespace_confirm = 0

    -- strip white lines at the end of the file when stripping whitespace
    vim.gkstrip_whitelines_at_eof = 1

    -- Disables better-whitespace by default on these file types
    vim.g.better_whitespace_filetypes_blacklist = {
        'diff',
        'git',
        'gitcommit',
        'unite',
        'qf',
        'help',
        'markdown',
        'toggleterm',
        'NvimTree',
    }
end

return M
