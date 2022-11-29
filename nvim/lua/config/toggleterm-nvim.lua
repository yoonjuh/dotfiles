-- https://github.com/akinsho/toggleterm.nvim

require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 30
    elseif term.direction == "vertical" then
      -- return vim.o.columns * 0.4
      return 70
    end
  end,
  open_mapping = [[<c-\>]],

  -- 'vertical' | 'horizontal' | 'tab' | 'float'
  direction = "horizontal",
  persist_size = false,
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    -- 'single' | 'double' | 'shadow' | 'curved' 
    border = 'curved',
    -- like `size`, width and height can be a number or function which is passed the current terminal
    winblend = 0,
    shell = vim.o.shell,
    highlights = {
      border = "Normal",
      background = "Normal"
    }
  },
})


function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

