export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$HOME/.cargo/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# FZF CONFIGS
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# LOAD NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PURE PROMPT SETUP
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
ZSH_THEME=""

# ZSH PLUGINS
plugins=(
  colored-man-pages
  vi-mode
  tmux
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Automatically start tmux if installed
ZSH_TMUX_AUTOSTART=true

# Auto ls after cd 
function chpwd() {
  colorls -lA --sd
}

# Read .nvmrc after change directory
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    # echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# RELOAD 
source $ZSH/oh-my-zsh.sh 

# Colorls ruby setup
eval "$(rbenv init -)"

# Aliases 
alias v="nvim"
alias zshc="nvim ~/.zshrc"
alias reload="source ~/.zshrc"
alias settings="nvim ~/.config/nvim/init.vim"
# alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias code='open -b com.microsoft.VSCode "$@"'
alias ga="git add"
alias gc="git commit -m"
alias gd="git diff"
alias gs="git status"
alias gp="git push"
alias lc="colorls -lA --sd"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
