call plug#begin( '~/.config/nvim/plugged' )
  
  " Syntax
  Plug 'sheerun/vim-polyglot'
  Plug 'leafgarland/typescript-vim'
  Plug 'ianks/vim-tsx'

  "Auto Complition
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "fzf 
  Plug 'junegunn/fzf', { 'do': { -> fzf#install()  } } 
  Plug 'junegunn/fzf.vim'

  " Utils
  Plug 'jiangmiao/auto-pairs'
  Plug 'airblade/vim-rooter'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'scrooloose/nerdcommenter'

  " Themes
  Plug 'joshdick/onedark.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/seoul256.vim'

  call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len( filter( values( g:plugs ), '!isdirectory( v:val.dir )' ) )
  \|   PlugInstall --sync | q
  \| endif


