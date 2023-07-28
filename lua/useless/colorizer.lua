local M = {
    "norcalli/nvim-colorizer.lua", -- show color from hex
    event = { "BufRead", "BufNewFile" },
}

function M.config()
    require('colorizer').setup()
end

return M
