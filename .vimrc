
set nocompatible
filetype off

call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'vim-ruby/vim-ruby'
Plug 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'html', 'css'] }
Plug 'prettier/vim-prettier'
Plug 'w0rp/ale'
Plug 'rbgrouleff/bclose.vim'
Plug 'cohama/lexima.vim'
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

" Plug 'pangloss/vim-javascript'
" Plug 'othree/yajs.vim'
" Plug 'othree/es.next.syntax.vim'
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'isRuslan/vim-es6'

Plug 'scrooloose/nerdtree'
Plug 'mxw/vim-jsx', { 'for': ['jsx','javascript.jsx']}
Plug 'tomtom/tcomment_vim'
Plug 'ervandew/supertab'
Plug 'othree/html5.vim'

" Colour Themes
Plug 'GertjanReynaert/cobalt2-vim-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'crusoexia/vim-monokai'
Plug 'junegunn/seoul256.vim'
Plug 'liuchengxu/space-vim-dark'

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
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  if (has("termguicolors"))
    set termguicolors
  endif
endif

if (has("autocmd"))
  augroup colorextend
    autocmd!
    " Make `Function`s bold in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
    " Override the `Statement` foreground color in 256-color mode
    autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 128 } })
    " Override the `Identifier` background color in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "bg": { "gui": "#333333" } })
  augroup END
endif

if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
  augroup END
endif

let g:onedark_color_overrides = {
\ "black": {"gui": "#2F343F", "cterm": "235", "cterm16": "0" },
\ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
\}

if has("gui_running")
  set guifont=Operator\ Mono:h14
  set linespace=2
  set guioptions-=r
endif

set term=xterm
set t_Co=256
set termguicolors
" let &t_AB="\e[48;5;%dm"
" let &t_AF="\e[38;5;%dm"
colo onedark
"colo seoul256
"colo space-vim-dark
"colorscheme cobalt2
"colorscheme monokai
"colorscheme base16-tomorrow-night
" set background=dark


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
set backupdir=~/.tmp
set directory=~/.tmp
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
"
" hi Pmenu ctermfg=white ctermbg=blue
" hi CursorLineNr ctermfg=darkgrey ctermbg=blue
" hi LineNr ctermfg=grey ctermbg=darkblue
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

" NERDTree
nnoremap <leader>q :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1

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


" Markdown
let g:markdown_fenced_languages = ['css', 'py=python', 'javascript', 'js=javascript', 'json=javascript',  'sass', 'xml']

" JSX
let g:jsx_ext_required = 0
let g:javascript_enable_domhtmlcss = 1
let g:used_javascript_libs = 'underscore,react'

" Emmet
let g:user_emmet_settings={'javascript.jsx': {'extends':'jsx'}}
let g:user_emmet_leader_key='<C-t>'

" Layout switcher
let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
let g:XkbSwitchEnabled = 1

" Prettier
nmap <Leader>p <Plug>(Prettier)
let g:prettier#exec_cmd_async = 1
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'flow'
let g:prettier#config#config_precedence = 'prefer-file'
let g:prettier#config#prose_wrap = 'preserve'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" Ale
let g:ale_set_highlights = 0
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

