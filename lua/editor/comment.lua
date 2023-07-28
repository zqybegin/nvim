local M = {
    "numToStr/Comment.nvim",
    event = { "BufRead", "BufNewFile" },
}

function M.config()
    require('Comment').setup()
end

return M
