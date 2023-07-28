local M = {
    "mg979/vim-visual-multi", -- vim multi line
    -- need to config there: https://github.com/mg979/vim-visual-multi/issues/241
    event = { "BufRead", "BufNewFile" },
    init = function()
        vim.g.VM_theme = 'codedark'            -- ":VMTheme codedark", to preview
        vim.g.VM_maps = {
            ["Add Cursor Down"] = '<C-j>',     -- new cursor down
            ["Add Cursor Up"] = '<C-k>',       -- new cursor up
        }
    end,

}

return M
