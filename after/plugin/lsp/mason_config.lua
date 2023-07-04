-- Plugin One: mason config
local mason_status_ok, mason = pcall(require, 'mason')
if not mason_status_ok then
    return
end

mason.setup()

-- Plugin Two: mason-lspconfig config
local masonconfig_status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not masonconfig_status_ok then
    return
end

local servers = {
    "lua_ls",
    "svlangserver",
    "clangd",
    "cmake",
}

mason_lspconfig.setup({
    -- A list of servers to automatically install if they're not already installed.
    ensure_installed = servers,

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    automatic_installation = true,

    -- See `:h mason-lspconfig.setup_handlers()`
    handlers = nil,
})

return servers
