-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print "packer don't exist"
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'      -- Packer can manage itself

    -- theme
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    -- Plugins
    use "nvim-lua/popup.nvim"         -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"       -- Useful lua functions used ny lots of plugins

    use 'nvim-tree/nvim-tree.lua'     -- file tree
    use 'nvim-tree/nvim-web-devicons' -- file tree icon
    use "nvim-telescope/telescope.nvim" -- fuzzy find
    use 'folke/which-key.nvim'        -- help to remember the meaning of key 
    use 'yamatsum/nvim-cursorline'    -- underline the word under the cursor 
    use 'numToStr/Comment.nvim'       -- comment
    use 'gelguy/wilder.nvim'          -- cmd autocompletion 
    use 'romgrk/fzy-lua-native'       -- used by wilder.nvim highlight 

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use "nvim-treesitter/nvim-treesitter-context"   -- highlight code based on treesitter
    use "mbbill/undotree"                           -- smart to record undo list

    -- cmp plugins
    use "hrsh7th/nvim-cmp"          -- The completion plugin
    use "hrsh7th/cmp-buffer"        -- source of buffer completions
    use "hrsh7th/cmp-path"          -- source of path completions
    use "hrsh7th/cmp-cmdline"       -- source of cmdline completions
    use "saadparwaiz1/cmp_luasnip"  -- source of snippet completions
    use "hrsh7th/cmp-nvim-lsp"      -- source of lsp completions 
    use "hrsh7th/cmp-nvim-lua"      -- source of nvim config completions

    -- snippets
    use "L3MON4D3/LuaSnip"              --snippet engine
    use "rafamadriz/friendly-snippets"  -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig"             -- enable LSP
    use "williamboman/mason.nvim"           -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
    use 'jose-elias-alvarez/null-ls.nvim'   -- LSP diagnostics and code actions

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

