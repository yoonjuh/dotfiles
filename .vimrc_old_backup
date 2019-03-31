
set nocompatible
filetype off

call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'html', 'css'] }
Plug 'prettier/vim-prettier'
Plug 'w0rp/ale'
Plug 'rbgrouleff/bclose.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'gorkunov/smartpairs.vim'
Plug 'djoshea/vim-autoread'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'Valloric/YouCompleteMe'
Plug 'heavenshell/vim-jsdoc'
Plug 'scrooloose/syntastic'
Plug 'sbdchd/neoformat'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'mxw/vim-jsx', { 'for': ['jsx','javascript.jsx']}
Plug 'tomtom/tcomment_vim'
Plug 'ervandew/supertab'
Plug 'othree/html5.vim'
Plug 'ap/vim-css-color'
Plug 'kien/ctrlp.vim'

" Colour Themes
Plug 'GertjanReynaert/cobalt2-vim-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'crusoexia/vim-monokai'
Plug 'junegunn/seoul256.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dracula/vim',{'as': 'dracula'}
Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'

 " Test Run
Plug 'tpope/vim-obsession'
Plug 'lyokha/vim-xkbswitch'

call plug#end()
filetype plugin indent on
syntax on

runtime macros/matchit.vim

" =============================================================
"                      APPEARENCE
" =============================================================

set term=xterm
set t_Co=256
set termguicolors
" let &t_AB="\e[48;5;%dm"
" let &t_AF="\e[38;5;%dm"
colo nova
set background=dark


"
" " =============================================================
" "                 GENERAL SETTINGS
" " =============================================================
" "
set backspace=indent,eol,start
set history=1000
set ruler
set showcmd
set autoindent
set showmatch
set nowrap
set autoread
set autowrite
" set backupdir=~/.tmp
" set directory=~/.tmp
set viminfo+=!
set guioptions-=T
set laststatus=2
set scrolloff=3
set sidescrolloff=4
set hidden
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set regexpengine=1
set relativenumber
set number
set wrap
set linebreak
set incsearch
set ignorecase
set hlsearch
set smartcase
set mouse=a
set shell=bash
set clipboard=unnamed
set winwidth=100
set winheight=5
set winminheight=5
set winheight=999
set noswapfile
set wildmenu
set nostartofline
" (Hopefully) removes the delay when hitting esc in insert mode
" " set noesckeys
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
set lazyredraw
set re=1

set path+=**
set tags=./tags;/

" " =============================================================
" "                    AUTOCOMMANDS
" " =============================================================
"
if has("autocmd")
  augroup vimrcEx
    au!

    autocmd BufRead *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
    " autocmd BufWinLeave *.* mkview
    " autocmd BufWinEnter *.* silent loadview

    au BufNewFile,BufReadPost *.md set filetype=markdown

    autocmd FileType javascript set formatprg=prettier\ --stdin
    autocmd BufLeave,FocusLost * silent! wall
  augroup END
endif

" =============================================================
"                      MAPPINGS
" =============================================================


let mapleader = ","

" insert mode
inoremap <c-e> <down>
inoremap <c-n> <left>
inoremap <c-y> <up>
inoremap <c-i> <right>

" Quick open most used files
nnoremap <leader>em :!open -a 'Marked 2.app' '%:p'<cr>
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>es :vs<cr>:UltiSnipsEdit<cr>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" create/open file in current folder
map <Leader>ee :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

nnoremap <silent> <space> :nohl<Bar>:echo<CR>
nnoremap <leader>w mzyyp`zj
nnoremap <leader>v :set invpaste paste?<CR>
nnoremap <leader>V V`]
nnoremap <leader>I V`]=
nmap k gk
nmap j gj

noremap <Leader>d :Bclose<CR>
noremap <Leader>D :bufdo bd<CR>

cnoremap %% <C-R>=expand("%:p:h") . "/" <CR>

" FZF
nnoremap <leader>f :GFiles<cr>
nnoremap <leader>F :Files<cr>
nnoremap <leader>. :Buffers<cr>

" Fugitive
nnoremap <leader>g :Gstatus<CR>:only<CR>

" Tabs
nnoremap <leader>1 1gt<cr>
nnoremap <leader>2 2gt<cr>
nnoremap <leader>3 3gt<cr>
nnoremap <leader>4 4gt<cr>

" inc search for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``

" saves cursor after yanking in visual mode
vnoremap y myy`y
vnoremap Y myY`y

" =============================================================
"                 PLUGINS CONFIGURATION
" =============================================================

let g:neoformat_try_formatprg=1
augroup NeoformatAutoFormat
  autocmd!
  autocmd FileType javascript,javascript.jsx  setlocal formatprg=prettier\
                                          \--stdin\
                                          \--print-width\ 80\
                                          \--single-quote\
                                          \--trailing-comma\ es6
  autocmd BufWritePre *.js Neoformat
augroup END

"Auto pair
"let g:autoPairsFlyMode

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = {
      \ 'dir': '\.git$\|\.yardoc\|node_modules\|\log\|tmp$',
      \ 'file': '\.so$\|\.dat$|\.DS_Store$'
      \ }

" NERDTree
nnoremap <leader>q :NERDTreeToggle<cr>
let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=20
let NERDTreeShowHidden=1

"Syntastic
let g:syntastic_javascript_checkers = ['eslint']

"YCM/UltiSnips/SuperTab
let g:ycm_key_list_select_completion = [ '<C-n>', '<Down>' ]
let g:ycm_key_list_previous_completion = [ '<C-p>', '<Up>' ]
let g:SuperTabDefaultCompletionTytpe= '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForWardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Easymotion
nmap s <Plug>(easymotion-s)
omap s <Plug>(easymotion-bd-t)
vmap s <Plug>(easymotion-bd-t)

" Vim Move
let g:move_key_modifier = 'C'

"Async engine settings
"
" Ale let g:ale_set_highlights = 1
let g:ale_fixers = {
      \ 'javascript': ['prettier', 'eslint']
      \}

let g:ale_fix_on_save=1
let g:ale_completion_enabled=1

" Markdown
let g:markdown_fenced_languages = ['css', 'py=python', 'javascript', 'js=javascript', 'json=javascript',  'sass', 'xml']

" JSX
let g:jsx_ext_required = 0
let g:javascript_enable_domhtmlcss = 1
let g:used_javascript_libs = 'underscore,react'

" Emmet
let g:user_emmet_settings={'javascript.jsx': {'extends':'jsx'}}
let g:user_emmet_leader_key='<C-t>'


nmap <silent> <Leader>au <Plug>(ale_previous_wrap)
nmap <silent> <Leader>ae <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" =============================================================
"                      CUSTOM FUNCTIONS
" =============================================================

" Create folders on file save
" ===========================

function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

" Remove whitespaces on save saving cursor position
" =================================================

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

