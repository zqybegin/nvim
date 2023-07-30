local M = {
    "preservim/tagbar", -- show the outline fucntion of this file
    cmd = { "TagbarToggle" },
}

function M.config()
    -- vim should be closed if tagbar and netrw are the last windows open.
    vim.cmd([[let g:tagbar_autoclose_netrw = 1]])
    -- set tagbar open position
    vim.cmd([[let g:tagbar_position = 'botright vertical']])
    vim.cmd([[let g:tagbar_width = max([15, winwidth(0) / 7])]])
    -- tag are sorted according to their order in the source fi[[l
    vim.cmd([[let g:tagbar_sort = 0]])
    vim.cmd([[let g:tagbar_indent = 1]])
    -- don't show visibility of function
    vim.cmd([[let g:tagbar_show_visibility = 0]])
    -- change word
    vim.cmd([[let g:tagbar_iconchars = ['▶', '▼'] ]])
    -- change cursor highlight
    vim.cmd([[highlight TagbarHighlight ctermfg=0 ctermbg=11 guifg=#2c2d30 guibg=Grey]])

    -- A compromise solution would be to allow the width of tagbar to adjust with the window size.
    -- However, if we simply set a maximum width, it will only be determined when loading the tagbar plugin.
    -- Therefore, create an autocommand that automatically readjusts the width of tagbar when the window size changes.
    vim.api.nvim_create_autocmd({ "VimResized" }, {
        callback = function()
            -- Adjust the width of tagbar based on window size
            vim.cmd([[let g:tagbar_width = max([15, winwidth(0) / 7])]])
            -- if tagbar has toggled, reopen tagbar.
            -- if not, two toggle will not open tagbar.
            vim.cmd([[TagbarToggle]])
            vim.cmd([[TagbarToggle]])
        end,
    })
end

return M
