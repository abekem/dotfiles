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
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'folke/lsp-colors.nvim' }
  use { 'norcalli/nvim-colorizer.lua' }

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
  use { 'nvim-tree/nvim-web-devicons' }

  -- install telescope
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'akinsho/nvim-bufferline.lua' }

  use { 'lewis6991/gitsigns.nvim' }
  use { 'dinhhuy258/git.nvim' } -- For git blame & browse

  use { 'keaising/im-select.nvim' }
end)
