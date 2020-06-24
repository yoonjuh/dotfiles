
" Python3 Provider
let g:python3_host_prog = expand("/usr/bin/python3")

let mapleader=","

syntax enable                           " Enables syntax highlighing
filetype plugin indent on

set encoding=utf-8                      " The encoding displayed 
set fileencoding=utf-8                  " The encoding written to file
scriptencoding utf-8

"SEARCH
set ignorecase
set smartcase
set incsearch
set hlsearch                            " highlight matche

set colorcolumn=120
set autoread                            " Automatically re-read file if a change was detected outside of vim
set number                              " Enable line numbers
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set ruler              		              " Show the cursor position all the time

" FOLDING
set foldenable
set foldlevelstart=10                   " default folding level when buffer is opened
set foldnestmax=10                      " maximum nested fold
set foldmethod=syntax                   " fold based on indentation

set pumheight=10                        " Makes popup menu smaller
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse

set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right

set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set showtabline=2                       " Always show tabs 
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent
set copyindent                          " copy indent from the previous line
set autoindent                          " Good auto indent

set laststatus=0                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like

set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set noswapfile

"set updatetime=300                      " Faster completion
set timeoutlen=300                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

"Vue
let g:vue_disable_pre_processors = 1

" Workaround for prevent inserting newline comment
autocmd FileType * set formatoptions-=cro

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" True color support
if ( has( "nvim" ) )
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if( has( "termguicolors" ) )
  set termguicolors
endif


