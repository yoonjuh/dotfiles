-- https://github.com/nvim-telescope/telescope.nvim

local telescope = require('telescope')
local dotfiles_dir = "~/dotfiles"

telescope.setup({
  extensions = {
    repo = {
      list = {
        -- This is option to exclude files that listed in .gitignore 
        fd_opts = { "--no-ignore-vcs" },
        search_dirs = {
          "~/dotfiles",
          "~/projects",

          -- This is where all the go projects are located
          -- This might throw an error is GOPATH is not defiend
          os.getenv("GOPATH") .. "/src"
        },
      },
    },
  },
  pickers = {
    find_files = {
      find_command = {
        -- This way, it will display the hiddne files as well
        "rg",
        "--files",
        "--hidden",
        "--glob",
        "!**/.git/*"
      },
    },
  }
})

-- BUILTIN MAPPINGS
local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", options)
keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", options)
keymap('n', '<leader>co', "<cmd>lua require('telescope.builtin').colorscheme()<cr>", options)

-- This is where I usually put my dotfiles
keymap('n', '<leader>fc', "<cmd>lua require('telescope.builtin').find_files({ cwd='" .. dotfiles_dir .. "'})<cr>", options)

-- Save alias
keymap('n', '<c-s>', ':w<CR>', {})


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


