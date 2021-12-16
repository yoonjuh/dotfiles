local packer = require("config.packer")

if not packer then
    return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'preservim/nerdcommenter'
  -- TODO: There is an issue with fzf terminal mode navigation that was cause by vim-tmux-navigator
  use 'christoomey/vim-tmux-navigator'

  -- LSP
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'williamboman/nvim-lsp-installer'

  -- Highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('config.treesitter') end,
    run = ':TSUpdate',
  }

  -- THEMES
  use 'Mofiqul/vscode.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'ful1e5/onedark.nvim'
  use 'marko-cerovac/material.nvim'
  use "projekt0n/github-nvim-theme"
  use "catppuccin/nvim"


  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require('config.nvim-tree') end,
  }

  -- TELESCOPE
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require('config.telescope') end,
  }

  use 'nvim-telescope/telescope-fzy-native.nvim'

  use {
    'numToStr/Comment.nvim',
    config = function() require('config.comment-nvim') end,
  }

  -- Better comment in TS
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use {
    'windwp/nvim-autopairs',
    config = function() require('config.nvim-autopair') end,
  }

end)
