export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$HOME/.cargo/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# FZF CONFIGS
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export GATA_ROOT="$HOME/gataweb"
export TERM='screen-256color'

# NVIMRC PATH
export NVIM_ROOT="$HOME/dotfiles/nvim"
export NVIMRC="$NVIM_ROOT/init.vim"

# LOAD NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export KEYTIMEOUT=5           # Reduce the delay after you press <ESC>

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Alacritty Completion and functions path
fpath+=$HOME/.zsh/.zsh_functions

# PURE PROMPT SETUP
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
ZSH_THEME=""

# ZSH PLUGINS
plugins=(
  git
  colored-man-pages
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
   echo -ne '\e[5 q'
}

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
alias alac="nvim ~/.config/alacritty/alacritty.yml"
alias debug_alac="RUST_BACKTRACE=1 /Applications/Alacritty.app/Contents/MacOS/alacritty -vvv"

alias tmux_clean="tmux kill-server"

alias v="nvim"
alias zshc="nvim ~/.zshrc"
alias reload="source ~/.zshrc"
alias settings="nvim ~/.config/nvim/init.vim"
# alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias code='open -b com.microsoft.VSCode "$@"'
alias lc="colorls -lA --sd"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
