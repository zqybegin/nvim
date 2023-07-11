-- add sinppte from friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load{
    exclude = { "verilog" }, --use my cool verilog snippets
}

-- load snippets from my-cool-snippets
require("luasnip.loaders.from_vscode").lazy_load(
    { paths = "~/.config/nvim/my-cool-snippets/" }
)

-- https://www.reddit.com/r/neovim/comments/yiimig/cmp_luasnip_jump_points_strange_behaviour/
require("luasnip").config.set_config({
  region_check_events = 'InsertEnter',
  delete_check_events = 'InsertLeave'
})
