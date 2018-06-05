set nocompatible     "To enable all the good vim features   
let mapleader=","    "Change mapleader
syntax enable
set shell=bash

" => Color scheme settings
let base16colorspace=256
"set background=dark

"set t_Co=256
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
colorscheme palenight
"set termguicolors

autocmd ColorScheme * highlight LineNr ctermbg=none ctermfg=23
autocmd ColorScheme * highlight CursorLine ctermbg=23 ctermfg=255
autocmd ColorScheme * highlight TabLine ctermfg=255 ctermbg=23
autocmd ColorScheme * highlight TablineFill cterm=underline ctermfg=255 ctermbg=23
autocmd ColorScheme * highlight TabLineSel ctermbg=255 ctermfg=1
autocmd ColorScheme * highlight Folded ctermbg=none ctermfg=23
autocmd ColorScheme * highlight FoldColumn ctermbg=none ctermfg=23
autocmd ColorScheme * highlight SignColumn ctermbg=none


"Set temporary storage directories
set undodir=~/.vim/tmp/undo
set nobackup
set noswapfile

set ignorecase            "Ignore case when searching
set smartcase
set hlsearch              "Highlight search terms"
set incsearch             "Highlight search terms dynamically as they are being typed
set laststatus=2          "always show status bar
set showmode              "always show the current mode
set title                 "Show the current filename in the titlebar
set noerrorbells          "shhhhhh...

set showmatch             "Show matching brackets / parenthesis
set expandtab             "Expand tabs to spaces
set smarttab              "Tab inserts spaces
set softtabstop=2         "Tab inserts 2 spaces
set shiftwidth=2          "Number of spaces used for indenting
set list
set listchars=tab:>-

set autochdir             "set the current files dir as the current"
set smartindent           "unless closing a bracket then we jump to that indent location
set autoindent            "use indent from last line on new line
set backspace=indent,eol,start
set number                "turn line numbers on
set relativenumber        "turn relative line numbers on"
set cursorline            "highlight cursors line
set ruler                 "show the cursors position in the status bar
set mouse=a               "allow mouse in all modes
set nowrap                "Do not wrap lines
set history=1000          "Increase history buffer to 1000
set autoread              "Auto read remote / outside changes to the open file
set hidden                "Remember buffer history / undo when bringing a buffer to foreground

set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Panel, window, and tab management
"map new & close tabs
map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>

map <leader>tm :tabedit %<CR>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => String / file manipulation

"strip all trailing whitespace from a file
nnoremap <leader>ws :%s/\s\+$//<CR>:let @/=''<CR>

"toggle paste
map <leader>sp :set paste!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Convenience mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable
set foldcolumn=1
set foldlevel=0
set foldminlines=0
set foldnestmax=1

"Allow indent and manual folding.
"augroup vimrc
"  au BufReadPre * setlocal foldmethod=indent
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END

"Toggle folds with the spacebar
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extras
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Highlight trailing whitespace
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=124
"au ColorScheme * highlight ExtraWhitespace ctermbg=124
"au BufEnter * match ExtraWhitespace /\s\+$/
"au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"au InsertLeave * match ExtraWhiteSpace /\s\+$/



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"theme setting
if(has("termguicolors"))
  set termguicolors
endif

"vim-jsdoc
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_additional_descriptions=1
let g:jsdoc_input_description=1
let g:jsdoc_enable_es6=1
nmap <silent> <leader>doc <Plug>(jsdoc)

"Fugitive (remap for convenience)
"map <leader>gs :Gstatus<CR>
"map <leader>gb :Gblame<CR>
"map <leader>gc :Gcommit<CR>
"map <leader>gg :Ggrep
"autocmd QuickFixCmdPost *grep* cwindow
"set statusline +=%{fugitive#statusline()}

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = {
      \ 'dir': '\.git$\|\.yardoc\|node_modules\|\log\|tmp$',
      \ 'file': '\.so$\|\.dat$|\.DS_Store$'
      \ }

"NERDTree
let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=20

"Syntastic
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = 'yarn run lint --'

"vim-jsx
let g:jsx_ext_required = 0

"YCM/UltiSnips/SuperTab (allow use of <tab> for both YCM & UltiSnips)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"Tabular
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:<CR>
vmap <leader>a: :Tabularize /:<CR>

"Tagbar
nmap <leader>t :TagbarToggle<CR>

"EasyMotion
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"Pretier
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

"Async engines settings 
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \}

let g:ale_fix_on_save=1
let g:ale_completion_enabled=1

"let g:prettier#quickfix_enable=0
"autocmd FileType javascript set formatprg=prettier\ --stdin
"autocmd BufWritePre *.js :normal gggqG

" Mappings for moving lines and preserving indentation
" See http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

call plug#begin('~/.vim/plugs')
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-fugitive'
Plug 'claco/jasmine.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'ap/vim-css-color'
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'mattn/gist-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'tomlion/vim-solidity'
Plug 'plasticboy/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/webapi-vim'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'heavenshell/vim-jsdoc'
Plug 'othree/html5.vim'
Plug 'mxw/vim-jsx'
Plug 'metakirby5/codi.vim'
Plug 'janko-m/vim-test'
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dracula/vim',{'as': 'dracula'}
call plug#end()
