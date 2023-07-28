local M = {
    "gelguy/wilder.nvim", -- cmd autocompletion
    event = { "CmdlineEnter", },
    dependencies = {
        "romgrk/fzy-lua-native", -- used by wilder.nvim highlight
    },
}

function M.config()
    -- if plugin isn't loaded, only return and don't report error
    local wilder = require('wilder')

    -- remove nvim tab complution, this will confused when press <Tab>
    vim.opt.wildmenu = false

    wilder.setup({
        modes = { ':', '/', '?' },
        next_key = '<C-j>',
        previous_key = '<C-k>',
        accept_key = '<Tab>',
    })

    wilder.set_option('pipeline', {
        wilder.branch(
            wilder.cmdline_pipeline({
                fuzzy = 1,
                set_pcre2_pattern = 1,
            }),
            wilder.python_search_pipeline({
                pattern = 'fuzzy',
            })
        ),
    })

   wilder.set_option('renderer', wilder.renderer_mux({
        [':'] = wilder.popupmenu_renderer({
            highlighter = {
                wilder.lua_fzy_highlighter(),
                wilder.basic_highlighter(),
            },
            highlights = {
                accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#f4468f' } }),
            },
        }),
    }))
end

return M
