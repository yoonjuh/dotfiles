local packer = require("config.packer")

if not packer then
    return
end

return packer.startup(function(use)
   -- Package manager
  use 'wbthomason/packer.nvim'

  -- LSP: Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'
  use {
    -- Autocompletion plugin
    'hrsh7th/nvim-cmp',
    config = function() require('config.cmp-nvim')end,
  }

  -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  -- Snippets source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip'
  -- Snippets plugin
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Nvim Package manager
  use {
    "williamboman/mason.nvim",
    requires = { "williamboman/mason-lspconfig.nvim" },
    config = function() require('config.mason-nvim') end,
  }

  -- Highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('config.treesitter') end,
    run = ':TSUpdate',
  }

  -- Language specifics 
  use 'simrat39/rust-tools.nvim'

  -- File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
       -- optional, for file icon
      'kyazdani42/nvim-web-devicons',
    },
    config = function() require('config.nvim-tree') end,
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function() require("config.toggleterm-nvim") end,
  }

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function() require('config.comment-nvim') end,
  }

  -- TELESCOPE
  use 'cljoly/telescope-repo.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require('config.telescope') end,
  }

  use 'nvim-telescope/telescope-fzy-native.nvim'

  use {
    "ahmedkhalf/project.nvim",
    config = function() require("config.project-nvim") end
  }

  use "nvim-telescope/telescope-file-browser.nvim"

  -- Better comment in TS
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use {
    'windwp/nvim-autopairs',
    config = function() require('config.nvim-autopair') end,
  }

  --multi cursor
  use "mg979/vim-visual-multi"

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('config.gitsign-nvim') end,
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }

  -- GITGUB in NEOVIM
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function () require('config.octo-nvim') end
  }


  -- THEMES
  use 'Mofiqul/vscode.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'ful1e5/onedark.nvim'
  use 'marko-cerovac/material.nvim'
  use "projekt0n/github-nvim-theme"
  use "catppuccin/nvim"
  use "lunarvim/Onedarker.nvim"
  use "ellisonleao/gruvbox.nvim"
  use "EdenEast/nightfox.nvim"

  use {
    'nvim-lualine/lualine.nvim',
    config = function() require('config.lualine-nvim') end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'akinsho/bufferline.nvim',
    config = function() require('config.bufferline-nvim') end,
    requires = 'kyazdani42/nvim-web-devicons'
  }

end)

