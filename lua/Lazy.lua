-- Automatically install packer
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "

-- load lazy
require("lazy").setup({
    spec = {
        { import = "plugins" },
        { import = "colortheme" },
    },
    install = {
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
        -- try to load one of these colorschemes when starting an installation during startup
        -- import: you need change uncomment in such colortheme lua
        colorscheme = { require("colortheme.one-dark").name },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = true,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    checker = { enabled = true }, -- automatically check for plugin updates
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                -- "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                -- "tarPlugin",
                -- "tohtml",
                -- "tutor",
                -- "zipPlugin",
            },
        },
    },
})

    -- -- basic plugins
    -- "nvim-lua/popup.nvim",           -- An implementation of the Popup API from vim in Neovim
    -- "norcalli/nvim-colorizer.lua",   -- show color from hex
    --
    -- -- eidtor plugin
    -- -- "windwp/nvim-autopairs",    -- Autopairs, integrates with both cmp and treesitter
    --
    --
   -- -- "preservim/tagbar", -- show the outline fucntion of this file
    --
    --
    -- -- useful(useless) plugin
    -- "akinsho/toggleterm.nvim",  -- toggle and presist terminal
    -- "lambdalisue/suda.vim",     -- allows one to edit a file with prevledges from an unprivledged session
    -- "wakatime/vim-wakatime",    -- code time tracking
    --
