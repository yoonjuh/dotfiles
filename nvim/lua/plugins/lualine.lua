return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Enable statusline per buffer split
    opts.options = {
      globalstatus = false,
    }
    return opts
  end,
}
