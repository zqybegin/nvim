-- Waring: don't name this file as 'lua/packer.lua'. 
-- this will comflict with the default file name of packer manager

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- theme
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  -- filo tree
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional
      },
  }
  -- telescope to fuzzy find
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }
  -- View treesitter information directly
  use("nvim-treesitter/playground")
  -- highlight code based on treesitter
  use("nvim-treesitter/nvim-treesitter-context");
  -- smart to record undo list
  use("mbbill/undotree")


  -- lsp-zero
  use   {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
  }
  use { "folke/which-key.nvim" }      -- help to remember the meaning of key 
  use { "yamatsum/nvim-cursorline" }  -- underline the word under the cursor 
  use { "numToStr/Comment.nvim" }     -- comment

end)

