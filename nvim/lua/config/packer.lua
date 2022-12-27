local packer_okay = pcall(require, "packer")
if not packer_okay then
  print("Packer was not found")

  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    print("Installing packer")

    -- fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    -- vim.cmd("packadd packer.nvim")

    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath

    packer = require("packer")
    if packer then
      print("Packer has been installed successfully!")
    end
  else
    print("Seems like packer is installed, but could not be loaded")
  end
end

-- local ensure_packer = function()
--   local fn = vim.fn
--   local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
--   print("This is the install path "..install_path)
--   if fn.empty(fn.glob(install_path)) > 0 then
--     print("hit1")
--     fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--     vim.cmd [[packadd packer.nvim]]
--     return true
--   end
--   return false
-- end

-- local packer_bootstrap = ensure_packer()
-- print(packer_bootstrap)
local packer = require("packer")

-- packer.reset()

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
    prompt_border = "single",
  },
  profile = {
    enable = true,
  },
  compile_on_sync = true,
})

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]]

return packer

