local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

vim.g.indentLine_enabled = true
vim.g.indent_blankline_char = "▏"
-- vim.g.indent_blankline_char = "│"
-- vim.g.indent_blankline_char = "▎"

-- don't displays line on blank line
vim.g.indent_blankline_show_trailing_blankline_indent = false
-- displays indentation in the first column
vim.g.indent_blankline_show_first_indent_level = true
-- use treesitter to define current context and show color
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_show_current_context_start = false
-- color of line when show_current_context
vim.cmd [[highlight IndentBlanklineContextChar guifg=#E06C75 gui=nocombine]]
-- color of line when show_current_context_start
vim.cmd [[highlight IndentBlanklineContextStart guisp=#E06C75 gui=underline]]
-- vim.cmd [[highlight IndentBlanklineContextStart guisp=#00FF00 gui=nocombine]]

-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"

-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "space:"
-- vim.opt.listchars:append "eol:↴"

indent_blankline.setup({
    space_char_blankline = " ",
    -- show_end_of_line = true,
    -- space_char_blankline = " ",
    -- show_current_context = false,
    -- show_current_context_start = false,
    -- char_highlight_list = {
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    --     "IndentBlanklineIndent3",
    --     "IndentBlanklineIndent4",
    --     "IndentBlanklineIndent5",
    --     "IndentBlanklineIndent6",
    -- },
})
