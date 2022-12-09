-- https://github.com/ray-x/go.nvim#packernvim

--local path = require 'nvim-lsp-installer.core.path'
--local install_root_dir = vim.fn.stdpath.concat {'data', 'mason'}

require 'go'.setup({
  go = 'go',
  -- if set to 'gopls' will use golsp format
  goimport = 'gopls',
  -- if set to gopls will use golsp format
  filestruct = 'gopls',
  gofmt = "gofumpt",
  max_line_len = 120,
  tag_transform = false,
  test_dir = '',
  test_template = '',
  test_template_dir = '',
  verbose = false,
  comment_placeholder = '   ',
  lsp_cfg = true,
   -- true: set default gofmt in gopls format to gofumpt
  lsp_gofumpt = false,
   -- use on_attach from go.nvim
  lsp_on_attach = function() end,
  dap_debug = true,

  --gopls_cmd = {install_root_dir .. '/go/gopls'},
  fillstruct = 'gopls',
  dap_debug_gui = true,
  luasnip = true,
  gopls_cmd = nil,
  gopls_remote_auto = true,
})

vim.cmd("autocmd FileType go nmap <Leader><Leader>l GoLint")
vim.cmd("autocmd FileType go nmap <Leader>gc :lua require('go.comment').gen()")


-- local mason_registry = require'mason-registry'
--
-- local server_available, requested_server = mason_registry.get_available_servers("gopls")
-- if server_available then
--     requested_server:on_ready(function ()
--         local opts = require'go.lsp'.config() -- config() return the go.nvim gopls setup
--         requested_server:setup(opts)
--     end)
--     if not requested_server:is_installed() then
--         -- Queue the server to be installed
--         requested_server:install()
--     end
-- end

-- Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})


