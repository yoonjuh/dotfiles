require'nvim-tree'.setup {
  auto_close = true,
  hijack_cursor = true,
  open_on_setup = true,
  view = {
    side = "left"
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  }
}

local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>q", "<cmd>lua require('nvim-tree').toggle()<cr>", { noremap = true, silent = true } )
keymap("n", "<leader>tr", ":NvimTreeRefresh<cr>", { noremap = true } )

