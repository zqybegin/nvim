local M = {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
        timeout = 1000,
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.75)
        end,
    },
    }

function M.config()

    vim.notify = require("notify")

    vim.cmd [[ highlight NotifyERRORBorder guifg=#FF7272 ]]
    vim.cmd [[ highlight NotifyWARNBorder  guifg=#A4E57E ]]
    vim.cmd [[ highlight NotifyINFOBorder  guifg=#A4E57E ]]
    vim.cmd [[ highlight NotifyDEBUGBorder guifg=#8CCBEA ]]
    vim.cmd [[ highlight NotifyERRORIcon   guifg=#FF7272 ]]
    vim.cmd [[ highlight NotifyWARNIcon    guifg=#A4E57E ]]
    vim.cmd [[ highlight NotifyINFOIcon    guifg=#A4E57E ]]
    vim.cmd [[ highlight NotifyDEBUGIcon   guifg=#8CCBEA ]]
    vim.cmd [[ highlight NotifyTRACEIcon   guifg=#D484FF ]]
    vim.cmd [[ highlight NotifyERRORTitle  guifg=#FF7272 ]]
    vim.cmd [[ highlight NotifyWARNTitle   guifg=#FFDB72 ]]
    vim.cmd [[ highlight NotifyINFOTitle   guifg=#A4E57E ]]
    vim.cmd [[ highlight NotifyDEBUGTitle  guifg=#8CCBEA ]]
    vim.cmd [[ highlight NotifyTRACETitle  guifg=#D484FF ]]
    vim.cmd [[ highlight link NotifyERRORBody Normal ]]
    vim.cmd [[ highlight link NotifyWARNBody Normal ]]
    vim.cmd [[ highlight link NotifyINFOBody Normal ]]
    vim.cmd [[ highlight link NotifyDEBUGBody Normal ]]
    vim.cmd [[ highlight link NotifyTRACEBody Normal ]]

end

return M
