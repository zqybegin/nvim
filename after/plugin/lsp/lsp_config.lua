-- Funciton: highlight the word under cursor
local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlight then
        vim.api.nvim_exec(
        [[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]],
        false
        )
    end
end

-- Function define key map
local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>k", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>o", '<cmd>lua vim.diagnostic.open_float()<CR>',  opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>j", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

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
        -- add keybind and highlight
        on_attach =(function(client, bufnr)
            lsp_keymaps(bufnr) -- add keymap
            lsp_highlight_document(client) -- add highlight
        end),

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
