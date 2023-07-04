local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

indent_blankline.setup{
    enabled = true,
    char = "▏",
    -- char = "│",
    -- char = "▎",

    -- don't displays line on blank line,
    show_trailing_blankline_indent = false,

    -- displays indentation in the first column,
    show_first_indent_level = true,

    -- use treesitter to define current context and show color,
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = false,

}

-- color of line when show_current_context
vim.cmd [[highlight IndentBlanklineContextChar guifg=#E06C75 gui=nocombine]]
-- color of line when show_current_context_start
-- vim.cmd [[highlight IndentBlanklineContextStart guisp=#E06C75 gui=underline]]
-- vim.cmd [[highlight IndentBlanklineContextStart guisp=#00FF00 gui=nocombine]]

-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"

-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
