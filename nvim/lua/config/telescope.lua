-- https://github.com/nvim-telescope/telescope.nvim


local telescope = require('telescope')
telescope.setup({
  extensions = {
    repo = {
      fd_opts = { "--no-ignore-vcs" },
    },
    search_dirs = {
      "~/dotfiles",
      "~/projects"
    }
  }
})

local keymap = vim.api.nvim_set_keymap
keymap('n', '<c-s>', ':w<CR>', {})


local options = { noremap = true, silent = true }


-- BUILTIN MAPPINGS
keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", options)
keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", options)
keymap('n', '<leader>fo', "<cmd>lua require('telescope.builtin').find_files({ cwd='/home/edwin/onelocal'})<cr>", options)
keymap('n', '<leader>co', "<cmd>lua require('telescope.builtin').colorscheme()<cr>", options)


-- PLUGIN MAPPINGS

-- REPO
keymap('n', '<leader>rl', "<cmd>lua require('telescope').extensions.repo.list{}<cr>", options)

-- File Browser
-- https://github.com/nvim-telescope/telescope-file-browser.nvim#mappings
keymap('n', '<leader>p', "<cmd>lua require('telescope').extensions.file_browser.file_browser{}<CR>", options)

-- Load extentions
telescope.load_extension('fzy_native')
telescope.load_extension('file_browser')
telescope.load_extension('repo')


