local plugins = {
--   -- Packer can manage itself
--   { 'wbthomason/packer.nvim', opt = true },

  -- UI
  {
    'svrana/neosolarized.nvim',
    dependencies = { 'tjdevries/colorbuddy.nvim' },
  },
  { 'nvim-lualine/lualine.nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'folke/lsp-colors.nvim' },
  { 'norcalli/nvim-colorizer.lua' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'akinsho/nvim-bufferline.lua' },
  { 'lewis6991/gitsigns.nvim' },
  { 'dinhhuy258/git.nvim' }, -- For git blame & browse
--   { "lukas-reineke/indent-blankline.nvim" },
  { 'kevinhwang91/nvim-hlslens' },
  { 'petertriho/nvim-scrollbar' },

  -- LSP
  { 'hrsh7th/cmp-nvim-lsp' },            -- nvim-cmp source for neovim's built-in LSP
  { 'hrsh7th/nvim-cmp' },                -- Completion
  { 'neovim/nvim-lspconfig' },           -- LSP
  { 'jose-elias-alvarez/null-ls.nvim' }, -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  { 'nvimdev/lspsaga.nvim' }, -- LSP UIs

  { 'mfussenegger/nvim-jdtls' },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },

  -- File
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-telescope/telescope-file-browser.nvim' },

  -- Move
  -- { 'phaazon/hop.nvim' },
  { 'rlane/pounce.nvim' },
  { 'rapan931/lasterisk.nvim' },
  -- Edit
  { 'windwp/nvim-autopairs' },
  { 'windwp/nvim-ts-autotag' },
  { 'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    },
  },
  { "kylechui/nvim-surround" },

  { "johmsalas/text-case.nvim" },

  { 'keaising/im-select.nvim' },
    
}

local opts = {
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        --'matchparen',
        --'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)
