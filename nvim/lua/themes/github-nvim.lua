-- https://github.com/projekt0n/github-nvim-theme

require('github-theme').setup({
  -- Followings are default
  theme_style = "dark", -- dimmed, dark, light
  function_style = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},
  dark_sidebar = false,

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"}
})

