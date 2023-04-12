-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

packer.startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim', opt = true }

  -- UI
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'folke/lsp-colors.nvim' }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'nvim-tree/nvim-web-devicons' }
  use { 'akinsho/nvim-bufferline.lua' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'dinhhuy258/git.nvim' } -- For git blame & browse
  use { "lukas-reineke/indent-blankline.nvim" }
  use { 'kevinhwang91/nvim-hlslens' }
  use { 'petertriho/nvim-scrollbar' }

  -- LSP
  use { 'hrsh7th/cmp-nvim-lsp' }            -- nvim-cmp source for neovim's built-in LSP
  use { 'hrsh7th/nvim-cmp' }                -- Completion
  use { 'neovim/nvim-lspconfig' }           -- LSP
  use { 'jose-elias-alvarez/null-ls.nvim' } -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }

  use { 'glepnir/lspsaga.nvim' } -- LSP UIs

  use { 'mfussenegger/nvim-jdtls' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- File
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-file-browser.nvim' }

  -- Move
  use { 'phaazon/hop.nvim' }
  use { 'rapan931/lasterisk.nvim' }
  -- Edit
  use { 'windwp/nvim-autopairs' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }
  use { "kylechui/nvim-surround" }

  use { "johmsalas/text-case.nvim" }

  use { 'keaising/im-select.nvim' }
end)
