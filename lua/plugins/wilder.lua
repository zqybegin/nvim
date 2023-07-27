local M = {
    "gelguy/wilder.nvim", -- cmd autocompletion
    event = { "CmdlineEnter", },
    dependencies = {
        "romgrk/fzy-lua-native", -- used by wilder.nvim highlight
        "roxma/vim-hug-neovim-rpc",
        "roxma/nvim-yarp",
    },
}

function M.config()
    -- if plugin isn't loaded, only return and don't report error
    local wilder = require('wilder')

    wilder.setup({
        modes = { ':', '/', '?' },
        next_key = '<C-j>',
        previous_key = '<C-k>',
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

    local highlighters = {
        wilder.lua_fzy_highlighter(),
        wilder.basic_highlighter(),
    }

    wilder.set_option('renderer', wilder.renderer_mux({
        [':'] = wilder.popupmenu_renderer({
            highlighter = highlighters,
            highlights = {
                accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#f4468f' } }),
            },
        }),
    }))
    -- -- -- Disable Python remote plugin
    -- wilder.set_option('use_python_remote_plugin', 0)
    --
    -- wilder.set_option('pipeline', {
    --     wilder.branch(
    --         wilder.cmdline_pipeline({
    --             fuzzy = 2,
    --             fuzzy_filter = wilder.lua_fzy_filter(),
    --         }),
    --         wilder.vim_search_pipeline(),
    --         wilder.python_search_pipeline({
    --             pattern = 'fuzzy',
    --         })
    --
    --     )
    -- })
    --
    -- wilder.set_option('renderer', wilder.renderer_mux({
    --     [':'] = wilder.popupmenu_renderer({
    --         highlighter = {
    --             wilder.lua_fzy_highlighter(),
    --             wilder.basic_highlighter(),
    --         },
    --         highlights = {
    --             accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#f4468f' } }),
    --         },
    --         left = {
    --             ' ',
    --             wilder.popupmenu_devicons()
    --         },
    --         right = {
    --             ' ',
    --             wilder.popupmenu_scrollbar()
    --         },
    --     }),
    -- }))
end

return M
