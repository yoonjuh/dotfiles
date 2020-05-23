
"Save alias
nnoremap <leader>s :w<cr>

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>

" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

"Move selected lines vertically
xnoremap K :m '<-2<CR>gv=gv
xnoremap J :m '>+2<CR>gv=gv

"Remember the cursor position after yanking
vnoremap y myy`y
vnoremap Y myY`y

" Create a file on current, vertical and horizontal pane
nnoremap <leader>e :edit <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>S :split <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>v :vsplit <C-R>=expand("%:p:h") . "/" <CR>

"Remove search result highlighting
nmap <silent> <leader>/ :nohlsearch<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" You can't stop me
cmap w!! w !sudo tee %

