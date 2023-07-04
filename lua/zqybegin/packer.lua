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
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- theme
    use({ "rose-pine/neovim", as = "rose-pine" })
    use "folke/tokyonight.nvim"
    use "daschw/leaf.nvim"
    use "navarasu/onedark.nvim"

    -- basic plugins
    use "nvim-lua/popup.nvim"           -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"         -- Useful lua functions used by lots of plugins
    use "norcalli/nvim-colorizer.lua"   -- show color from hex
    use "ziontee113/icon-picker.nvim"   -- help you pick text icon
    use "stevearc/dressing.nvim"        -- icon picker needed

    -- eidtor plugin
    use "windwp/nvim-autopairs"    -- Autopairs, integrates with both cmp and treesitter
    use "numToStr/Comment.nvim"    -- comment
    use "gelguy/wilder.nvim"       -- cmd autocompletion
    use "romgrk/fzy-lua-native"    -- used by wilder.nvim highlight
    use{
        "mg979/vim-visual-multi",  -- vim multi line
        -- need to config there:https://github.com/mg979/vim-visual-multi/issues/241
        config = function ()
            vim.g.VM_theme = 'codedark'  -- use ":VMTheme codedark" to preview
            vim.g.VM_maps = {
                ["Add Cursor Down"] = '<C-j>',   -- new cursor down
                ["Add Cursor Up"] = '<C-k>',   -- new cursor up
            }
        end,
    }
    -- useful(useless) plugin
    use "akinsho/toggleterm.nvim"  -- toggle and presist terminal
    use "folke/which-key.nvim"     -- help to remember the meaning of key
    use "lambdalisue/suda.vim"     -- allows one to edit a file with prevledges from an unprivledged session
    use "wakatime/vim-wakatime"    -- code time tracking
    use "tyru/open-browser.vim"    -- open link in browser
    use "dstein64/vim-startuptime" -- view stratup time

    -- UI plugin
    use "lukas-reineke/indent-blankline.nvim"  -- show indent blankline
    use "ntpeters/vim-better-whitespace"  -- better handling of whitespace characters
    -- use "yamatsum/nvim-cursorline"  will error in nvimtree rename -- underline the word under the cursor
    -- use "RRethy/vim-illuminate"         -- highlight the word under the cursor
    use "lfv89/vim-interestingwords"    -- highlight word in the buffer

    -- nvim tree and bufferline
    use "nvim-tree/nvim-tree.lua"     -- file tree
    use "nvim-tree/nvim-web-devicons" -- file tree icon
    use "akinsho/bufferline.nvim"     -- bufferline control
    use "ojroques/nvim-bufdel"        -- close buffer gently
    -- use "moll/vim-byye" will be comfict with nvim-ts-rainbow

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
    use "jose-elias-alvarez/null-ls.nvim"   -- inject non-lsp into lsp-client

    -- telescope
    use "nvim-telescope/telescope.nvim"             -- fuzzy find
    use "nvim-telescope/telescope-media-files.nvim" -- Preview images... in telescope

    -- Treesitter
    use{"nvim-treesitter/nvim-treesitter", run = ":TSUpdate",}
    use "p00f/nvim-ts-rainbow"                      -- show rainbow color
    use "nvim-treesitter/nvim-treesitter-context"   -- highlight code based on treesitter
    use "mbbill/undotree"                           -- smart to record undo list
    use "nvim-treesitter/playground"                -- treesitter tree

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

