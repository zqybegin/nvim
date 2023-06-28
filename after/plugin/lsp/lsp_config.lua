-- the next config will used cmp_nvim_lsp
local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
    print "cmp_nvim_lsp isn't installed"
    return
end

-- nvim-lspconfig config
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

-- add the the absolute path of this file to package.path to easily require
local script_dir = debug.getinfo(1, 'S').source:sub(2):gsub('/[^/]+$', '')
package.path = package.path .. ';' .. script_dir .. '/?.lua'
local servers = require("mason_config")

for _, server in pairs(servers) do
   -- add handle config in handle.lua
    local opts = {
        -- add on attach keybind, this code is integrated in which-key.lua
        -- on_attach =(function(bufnr)
        --     lsp_keymaps(bufnr) -- add keymap
        -- end),

        -- default config this will be needed by cmp_nvim_lsp to link nvim_cmp and lsp
        capabilities = cmp_nvim_lsp.default_capabilities(),
    }

    server = vim.split(server, "@")[1]

    -- add server customizatioon:https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    -- because of the previous path addition, just 'setting.<server>.lua' is ok
    local require_ok, conf_opts = pcall(require, "settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    -- setting
    lspconfig[server].setup(opts)
end
