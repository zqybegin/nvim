local M = {
    "lfv89/vim-interestingwords",    -- highlight word in the buffer
    event = { "BufRead", "BufNewFile" },
}

function M.config()
    vim.g.interestingWordsDefaultMappings = 0
    vim.g.interestingWordsGUIColors = {'#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF'}
end

return M
