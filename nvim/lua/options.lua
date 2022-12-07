local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= "o" then scopes["o"][key] = value end
end

vim.g.mapleader = " "
vim.g.autoread = true
vim.g.python3_host_prog = "/usr/bin/python"

opt('b', 'expandtab', true)
opt('b', 'shiftwidth', 2)
opt('b', 'softtabstop', 2)
opt('w', 'number', true)
opt('o', 'clipboard', "unnamedplus")
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)
opt('o', 'termguicolors', true)
opt('o', 'hlsearch', true)
opt('o', 'hidden', true)
opt('o', 'smartcase', true)
opt('o', 'pumblend', 25 )
opt('o', 'swapfile', false )
opt('o', 'backup', false )
opt('o', 'mouse', 'a')
opt('o', 'cmdheight', 2)
opt('o', 'wrap', false)
opt('o', 'inccommand', 'split')
opt('o', 'smarttab', true)
opt('o', 'incsearch', true)

local cmd = vim.cmd

cmd [[
  syntax enable
  filetype plugin on
  set hidden
]]

-- Workaround for prevent inserting newline comment
cmd [[
  autocmd FileType * set formatoptions-=cro
]]

-- Add empty line at the end of file when writing a file like other vscode
cmd [[
  autocmd BufWritePre * if (getline('$') !~ "^\s*$") | call append(line('$'), "") | endif
]]

--vim.o.clipboard = "unnamedplus"

