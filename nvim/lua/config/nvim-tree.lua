-- https://github.com/nvim-tree/nvim-tree.lua

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require'nvim-tree'.setup {
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },

  -- auto_close = true,
  -- hijack_cursor = true,
  -- open_on_setup = true,
  -- view = {
  --   side = "left"
  -- },
  -- update_cwd = true,
  -- update_focused_file = {
  --   enable = true,
  --   update_cwd = true,
  -- }
}

local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>q", "<cmd>lua require('nvim-tree').toggle()<cr>", { noremap = true, silent = true } )
keymap("n", "<leader>tr", ":NvimTreeRefresh<cr>", { noremap = true } )

