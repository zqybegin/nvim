local M = {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = "BufReadPre",
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
        },
    },
}

function M.config()
    -- Plugin One: mason config
    local mason = require('mason')

    mason.setup()

    -- Plugin Two: mason-lspconfig config
    local mason_lspconfig = require('mason-lspconfig')

    mason_lspconfig.setup({
        -- A list of servers to automatically install if they're not already installed.
        ensure_installed = require("editor.lsp.lsp-settings.server").servers,

        -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
        automatic_installation = true,

        -- See `:h mason-lspconfig.setup_handlers()`
        handlers = nil,
    })
end

return M
