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
  use { 'wbthomason/packer.nvim', opt=true }
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'nvim-lua/plenary.nvim' }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use { 'nvim-tree/nvim-web-devicons' }

  -- install telescope
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'akinsho/nvim-bufferline.lua' }

  use { 'keaising/im-select.nvim' }
end)
