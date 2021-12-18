local keymap = vim.api.nvim_set_keymap

keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})
local opts = { noremap = true }
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
keymap('n', '<leader>,', ':nohl<CR>', { noremap = true, silent = true })

vim.cmd( [[
  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '<-2<CR>gv=gv 
]] )

-- Reselect visually selected lines after indent
vim.cmd([[
  vnoremap < <gv
  vnoremap > >gv
]])

-- Maintain yank position
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.cmd([[
  vnoremap Y myY`y
  vnoremap y myy`y
]])

