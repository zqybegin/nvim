local M = {
    "L3MON4D3/LuaSnip", -- snippet engie
    event = "InsertEnter",
    dependencies = {
        "rafamadriz/friendly-snippets", -- a bunch of snippets to use
    },
}


function M.config()
    -- add sinppte from friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load {
        exclude = { "verilog" }, --use my cool verilog snippets
    }

    -- load snippets from my-cool-snippets
    require("luasnip.loaders.from_vscode").lazy_load(
        { paths = "~/.config/nvim/lua/editor/snip/my-cool-snippets/" }
    )

    -- https://www.reddit.com/r/neovim/comments/yiimig/cmp_luasnip_jump_points_strange_behaviour/
    require("luasnip").config.set_config({
        region_check_events = 'InsertEnter',
        delete_check_events = 'InsertLeave'
    })
end

return M
