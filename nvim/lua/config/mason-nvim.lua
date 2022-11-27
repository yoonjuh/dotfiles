-- https://github.com/williamboman/mason.nvim


require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "sumneko_lua",
    "rust_analyzer",
    "clangd",
    "cssls",
    "dockerls",
    "eslint",
    "gopls",
    "golangci_lint_ls",
    "graphql",
    "groovyls",
    "html",
    "jsonls",
    "tsserver",
    "marksman",
    "pyright",
    "sqls",
    "taplo",
    "yamlls",
    "lemminx",
    "zls"
  },
  automatic_installation = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup { capabilities = capabilities }
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function ()
    local rust_tools = require("rust-tools")
    rust_tools.setup({
      capabilities = capabilities,
      server = {
        on_attach = function(_, bufnr)
           -- Hover actions
          vim.keymap.set("n", "<C-space>", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
          -- Code action groups
          vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
        end
      }
    })
  end,

  ["sumneko_lua"] = function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      default_opts = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      }
    })
  end
}

