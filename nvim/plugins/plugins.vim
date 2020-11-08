
" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif


call plug#begin( '~/.config/nvim/plugged' )
  
  " Syntax
  Plug 'sheerun/vim-polyglot'
  Plug 'leafgarland/typescript-vim'
  Plug 'ianks/vim-tsx'
  Plug 'digitaltoad/vim-pug'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'mxw/vim-jsx'

  "Auto Complition
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "fzf 
  Plug 'junegunn/fzf', { 'do': { -> fzf#install()  } } 
  Plug 'junegunn/fzf.vim'

  " Utils
  Plug 'jiangmiao/auto-pairs'
  Plug 'airblade/vim-rooter'
  Plug 'scrooloose/nerdtree'
  " Temporalily Disable Due to Alacritty
  "Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdcommenter'
  Plug 'kassio/neoterm'
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'lilydjwg/colorizer'
  Plug 'terryma/vim-smooth-scroll'

  " Themes
  Plug 'joshdick/onedark.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/seoul256.vim'
  Plug 'mhartington/oceanic-next'
  Plug 'joshdick/onedark.vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'drewtempelmeyer/palenight.vim'

  call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len( filter( values( g:plugs ), '!isdirectory( v:val.dir )' ) )
  \|   PlugInstall --sync | q
  \| endif


