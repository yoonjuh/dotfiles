local packer = require("config.packer")

if not packer then
    return
end

local function get_config(name)
  return string.format('require("config.%s")', name)
end

return packer.startup(function(use)
   -- Package manager
  use 'wbthomason/packer.nvim'

  -- LSP: Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'
  use {
    -- Autocompletion plugin
    'hrsh7th/nvim-cmp',
    config = get_config("cmp-nvim"),
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
    requires = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim"
    },
    config = get_config("lsp.mason-nvim"),
  }

  -- Highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    config = get_config('treesitter'),
    run = ':TSUpdate',
  }

  -- Language specifics 
  use 'simrat39/rust-tools.nvim'
  use {
    'ray-x/go.nvim',
    require = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'ray-x/guihua.lua'
    },
    config = get_config('go-nvim'),
  }

  -- File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
       -- optional, for file icon
      'kyazdani42/nvim-web-devicons',
    },
    config = get_config('nvim-tree'),
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = get_config("toggleterm-nvim"),
  }

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = get_config('comment-nvim'),
  }

  -- TELESCOPE
  use 'cljoly/telescope-repo.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = get_config('telescope'),
  }

  use 'nvim-telescope/telescope-fzy-native.nvim'

  use {
    "ahmedkhalf/project.nvim",
    config = get_config("project-nvim"),
  }

  use "nvim-telescope/telescope-file-browser.nvim"

  -- Better comment in TS
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use {
    'windwp/nvim-autopairs',
    config = get_config('nvim-autopair'),
  }

  --multi cursor
  use "mg979/vim-visual-multi"

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = get_config('gitsign-nvim'),
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
    config =  get_config('octo-nvim'),
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
    config = get_config('lualine-nvim'),
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'akinsho/bufferline.nvim',
    config = get_config('bufferline-nvim'),
    requires = 'kyazdani42/nvim-web-devicons'
  }

end)

