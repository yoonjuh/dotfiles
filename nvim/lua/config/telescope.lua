-- https://github.com/nvim-telescope/telescope.nvim

local telescope = require('telescope')
telescope.setup({})

local keymap = vim.api.nvim_set_keymap
keymap('n', '<c-s>', ':w<CR>', {})


local options = { noremap = true, silent = true }
keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", options )
keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", options )
keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", options )
keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", options )
keymap('n', '<leader>fo', "<cmd>lua require('telescope.builtin').find_files({ cwd='/home/edwin/onelocal'})<cr>", options )

-- Load extentions
telescope.load_extension('fzy_native')

