"================================================================
"=====                       PLUGINS                        =====
"================================================================

call plug#begin('~/.config/nvim/plugged')

"Syntax
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'

"???"""""""Typescript
"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
"
"For async completion
Plug 'Shougo/deoplete.nvim'
"For Denite features
Plug 'Shougo/denite.nvim'

"Utils
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'mattn/emmet-vim' 
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
"Plug 'SirVer/ultisnips'

" Themes
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'kiddos/malokai.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Wombat'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'joshdick/onedark.vim'
Plug 'ajh17/spacegray.vim'

call plug#end()


"================================================================
"=====                   BASIC SETTINGS                     =====
"================================================================


filetype plugin indent on
syntax on 

" Hybrid line numbers
set number relativenumber
set nu rnu

" Settings for split behaviors
set splitbelow splitright

"Default indent size
set tabstop=2
set shiftwidth=2
set expandtab

set incsearch
set ignorecase
set smartcase
set nohlsearch
set softtabstop=0
set expandtab
set nobackup
set noswapfile
set nowrap
set encoding=UTF-8

"Set bold serarch result
set hlsearch


"Smotth horizontal scroll
set sidescroll=1

"Move selected lines vertically
xnoremap K :m '<-2<CR>gv=gv
xnoremap J :m '>+2<CR>gv=gv

"Remember the cursor position after yanking
vnoremap y myy`y
vnoremap Y myY`y

" trigger key for every fancy things 
let mapleader=","

"Whenever I press <space>, search results go way
nnoremap <silent> <space> :nohl<Bar>:echo<CR>

" Create file on current directory
map <Leader>ee :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

"Save alias
nnoremap <leader>s :w<cr>

"================================================================
"=====                   theme settings                     =====
"================================================================

"gruvbox 
set termguicolors

"base16
let base16colorspace=256
colorscheme onedark

"Gruvbox
"""colorscheme gruvbox
"""let g:gruvbox_contrast_dark='soft'
"""let g:gruvbox_color_column='blue'
"""set background=dark    " Setting dark mode


"=================================================================
"=====               PLUGIN-SETTINGS                         =====
"=================================================================

"NERDTree 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

"let g:NERDTreeWinSize=25 
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlit

nnoremap <leader>q :NERDTreeToggle<CR>


"Fzf 
set rtp+=~/.fzf


" FZF 
nnoremap <leader>f :GFiles<cr>
nnoremap <leader>F :Files<cr>
nnoremap <leader>. :Buffers<cr>
nnoremap <leader>l :BLines<cr>
nnoremap <leader>L :Lines<cr>

"Ale eslint config 
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️' 
let g:ale_fix_on_save = 1


"vim-javascript config 
let g:javascript_plugin_ngdoc = 1

" Use deoplete 
let g:deoplete#enable_at_startup = 1


" VIM-AIRLINE 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

"UltiSnips

set runtimepath+=~/.config/nvim/my-snippets/
nmap <leader>ue :UltiSnipsEdit<cr>
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"


" VIM-EMMET 
"Enable extension for only html && css
"let g:user_emmet_install_global = 0 
"autocmd FileType html,css,js EmmetInstall

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

"Key mapping
let g:user_emmet_leader_key='<C-Z>' " so the trigger will be <C-Z>,


" DEOPLETE <TAB>: completion. 
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"



