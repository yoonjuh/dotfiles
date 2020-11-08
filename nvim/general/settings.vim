
" Python3 Provider
let g:python3_host_prog = expand("/usr/local/bin/python3")

let mapleader=","

" Note:
" How to trace down which function is triggering the attribute update
" :verbose set <user-attribute>?

" Enables syntax highlighing
syntax enable

filetype plugin indent on

" The encoding displayed 
set encoding=utf-8

" The encoding written to file
set fileencoding=utf-8
scriptencoding utf-8

"SEARCH
set ignorecase
set smartcase
set incsearch

" highlight matche
set hlsearch                            

set colorcolumn=120

" Automatically re-read file if a change was detected outside of vim
set autoread

set number                              

" Required to keep multiple buffers open multiple buffers
set hidden

" Display long lines as just one line
set nowrap

" Show the cursor position all the time
set ruler              		              

" FOLDING
set foldenable

" default folding level when buffer is opened
set foldlevelstart=10

" maximum nested fold
set foldnestmax=10

" fold based on indentation
set foldmethod=syntax

" Makes popup menu smaller
set pumheight=10

" More space for displaying messages
set cmdheight=2

" Enable your mouse
set mouse=a

" Horizontal splits will automatically be below
set splitbelow

" Vertical splits will automatically be to the right
set splitright                          

" Insert 2 spaces for a tab
set tabstop=2

" Change the number of space characters inserted for indentation
set shiftwidth=2

" Always show tabs 
set showtabline=2

" Makes tabbing smarter will realize you have 2 vs 4
set smarttab

" Converts tabs to spaces
set expandtab

" Makes indenting smart
set smartindent

" copy indent from the previous line
set copyindent

" Always display the status line
set laststatus=0

set number

set cursorline

" tell vim what the background color looks like
set background=dark

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" This is recommended by coc
set nobackup
set nowritebackup
set noswapfile

" By default timeoutlen is 1000 ms
set timeoutlen=300

" Copy paste between vim and everything else
set clipboard=unnamedplus

"Render empty space and new line as $ 
set list listchars=tab:>\ ,trail:-,eol:$

"Vue
let g:vue_disable_pre_processors = 1

" Auto source when writing to init.vm alternatively you can run :source $MYVIMRC
autocmd! BufWritePost $MYVIMRC source %

" Workaround for prevent inserting newline comment
autocmd FileType * set formatoptions-=cro

autocmd FileTYpe * setlocal indentkeys-=<:>

" Add empty line at the end of file when writing a file like other vscode  
autocmd BufWritePre * if (getline('$') !~ "^\s*$") | call append(line('$'), "") | endif

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


