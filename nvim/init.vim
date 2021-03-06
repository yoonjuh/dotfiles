
source $NVIM_ROOT/general/settings.vim

if exists('g:vscode')
  " VS Code extension
  "source $HOME/.config/nvim/vscode/settings.vim
  "source $HOME/.config/nvim/plug-config/easymotion.vim
else
  source $NVIM_ROOT/keys/mappings.vim
  source $NVIM_ROOT/plugins/plugins.vim
  source $NVIM_ROOT/themes/onedark.vim
  "source $NVIM_ROOT/themes/palenight.vim
  source $NVIM_ROOT/themes/airline.vim
  source $NVIM_ROOT/plug-config/coc.vim
  source $NVIM_ROOT/plug-config/fzf.vim
  source $NVIM_ROOT/plug-config/nerdtree.vim
  source $NVIM_ROOT/plug-config/neoterm.vim
  source $NVIM_ROOT/plug-config/signify.vim
  source $NVIM_ROOT/plug-config/scroll.vim
endif

