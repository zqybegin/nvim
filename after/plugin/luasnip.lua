-- add sinppte from friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load{
    exclude = { "verilog" }, --use my cool verilog snippets
}
-- load snippets from my-cool-snippets
require("luasnip.loaders.from_vscode").lazy_load(
    { paths = "~/.config/nvim/my-cool-snippets/" }
)

