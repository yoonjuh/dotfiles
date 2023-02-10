-- https://github.com/nvim-treesitter/nvim-treesitter

local treesitter_parsers = require("nvim-treesitter.parsers").get_parser_configs()
if not treesitter_parsers then
    return
end

treesitter_parsers.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main",
    },
}

local treesitter_config = require("nvim-treesitter.configs")
if not treesitter_config then
    return
end

treesitter_config.setup {
  ensure_installed = {
    "bash",
    "c",
    "comment",
    "css",
    "dockerfile",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "graphql",
    "git_rebase",
    "hjson",
    "javascript",
    "lua",
    "make",
    "markdown",
    "python",
    "regex",
    "rust",
    "scss",
    "terraform",
    "toml",
    "typescript",
    "vim",
    "yaml"
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

