-- https://github.com/windwp/nvim-autopairs

require('nvim-autopairs').setup(
  -- FOLLOWINGS ARE DEFAULTS

  -- local disable_filetype = { "TelescopePrompt" }
  -- local disable_in_macro = false  -- disable when recording or executing a macro
  -- local disable_in_visualblock = false -- disable when insert after visual block mode
  -- local ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", "")
  -- local enable_moveright = true
  -- local enable_afterquote = true  -- add bracket pairs after quote
  -- local enable_check_bracket_line = true  --- check bracket in same line
  -- local check_ts = false
  -- local map_bs = true  -- map the <BS> key
  -- local map_c_w = false -- map <c-w> to delete a pair if possible
)


-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())


-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
-- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

