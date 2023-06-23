-- ntpeters/vim-better-whitespace setup

-- the color of Whitespace highlighting
vim.cmd[[highlight ExtraWhitespace guibg='#61AFEF']]
-- enable highlighting and stripping whitespace on save by default
vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1
-- disable automatically stripping whitespace for large files,
vim.g.strip_max_file_size = 1000
-- don't be asked for confirmation before whitespace is stripped when you save the file
vim.g.strip_whitespace_confirm = 0
-- strip white lines at the end of the file when stripping whitespace
vim.gkstrip_whitelines_at_eof = 1
