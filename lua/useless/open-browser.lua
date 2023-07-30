local M = {
    "tyru/open-browser.vim",    -- open link in browser
    event = { "BufRead", "BufNewFile" },
    keys = {
        {"gx","<Plug>(openbrowser-smart-search)", desc = "goto link" },
    }
}

return M
