local M = {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}

function M.config()
    local null_ls = require("null-ls")
    null_ls.setup({
        debug = true,
        sources = {
            null_ls.builtins.formatting.verible_verilog_format,
            null_ls.builtins.diagnostics.shellcheck,
            null_ls.builtins.formatting.clang_format,
        },
    })
end

return M
