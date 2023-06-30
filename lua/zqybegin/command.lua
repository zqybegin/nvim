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
        -- 仅保存文件
        vim.cmd("w")
    end
end

