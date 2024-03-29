-- https://github.com/nvim-tree/nvim-tree.lua

local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")


-- Helper functions
local function collapse_all()
    require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
end

local function edit_or_open()
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
        view.close() -- Close the tree if file was opened

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
        view.close() -- Close the tree if file was opened
    end

end

local function vsplit_preview()
    -- open as vsplit on current node
    local action = "vsplit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)

    end

    -- Finally refocus on tree if it was lost
    view.focus()
end

--vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>" ,{silent = true, noremap = true})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require'nvim-tree'.setup({
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = "l", action = "edit", action_cb = edit_or_open },
        { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
        { key = "c", action = "close_node" },
        { key = "C", action = "collapse_all", action_cb = collapse_all },
        { key = "u", action = "dir_up" },
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = false
    }
  },
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  git = {
    ignore = false,
  }
})

local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>q", "<cmd>lua require('nvim-tree').toggle()<cr>", { noremap = true, silent = true } )
keymap("n", "<leader>tr", ":NvimTreeRefresh<cr>", { noremap = true } )

