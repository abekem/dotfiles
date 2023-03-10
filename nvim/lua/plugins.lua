-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use{ 'wbthomason/packer.nvim', opt = true}

  -- install telescope
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-telescope/telescope-file-browser.nvim'}

  use {'nvim-tree/nvim-web-devicons'}
end)

