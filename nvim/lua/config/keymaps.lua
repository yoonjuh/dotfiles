-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Multiline adjusting
vim.cmd([[
  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '<-2<CR>gv=gv 
]])

-- Add any additional keymaps here
-- Reselect visually selected lines after indent
vim.cmd([[
  vnoremap < <gv
  vnoremap > >gv
]])

-- Remove lazygit keymaps
keymap.del("n", "<leader>gg", opts)
keymap.del("n", "<leader>gG", opts)
keymap.del("n", "<leader>gf", opts)
keymap.del("n", "<leader>gl", opts)
keymap.del("n", "<leader>gL", opts)

-- Add Neogit keymap
keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit", noremap = true, silent = true })

-- TMUX navigation setup
keymap.set("n", "<C-h>", ":NvimTmuxNavigateLeft<Return>", opts)
keymap.set("n", "<C-j>", ":NvimTmuxNavigateDown<Return>", opts)
keymap.set("n", "<C-k>", ":NvimTmuxNavigateUp<Return>", opts)
keymap.set("n", "<C-l>", ":NvimTmuxNavigateRight<Return>", opts)
keymap.set("n", "<C-\\>", ":NvimTmuxNavigateLastActive<Return>", opts)
keymap.set("n", "<C-Space>", ":NvimTmuxNavigateNext<Return>", opts)
