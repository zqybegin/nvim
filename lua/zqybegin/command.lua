-- use simple way to use lsp formatting
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]

-- SmartSave
vim.cmd [[ command! SmartSave execute 'lua SmartSave()' ]]

function SmartSave()
    local filetype = vim.bo.filetype
    if filetype == "lua" then
        vim.cmd("w")
        vim.cmd("source %")
    else
        vim.cmd("w")
    end
end

-- Open help window in a vertical split to the right.
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--     group = vim.api.nvim_create_augroup("help_window_right", {}),
--     pattern = { "*" },
--     callback = function()
--         if vim.o.filetype == 'help' or vim.o.filetype == 'man' then vim.cmd.wincmd("L") end
--     end
-- })

-- easy way to exit some buffer
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
    callback = function()
        vim.cmd [[
        nnoremap <silent> <buffer> q :close<CR>
        set nobuflisted
        ]]
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Automatically close tab/vim when nvim-tree is the last window in the tab
-- vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

vim.api.nvim_create_autocmd({ "VimResized" }, {
    callback = function()
        vim.cmd "tabdo wincmd ="
    end,
})
