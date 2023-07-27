local M = {
    'kevinhwang91/nvim-ufo', -- make Neovim's fold look modern and keep high performance
    event = { "BufRead", "BufNewFile" },
    dependencies = {
        'kevinhwang91/promise-async',
        'luukvbaal/statuscol.nvim'
    }
}

function M.config()
    require('Comment').setup()
end

return M
