export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$HOME/.cargo/bin:$PATH"

# Reduce the delay after you press <ESC>
export KEYTIMEOUT=5

# PLUGINS
export ZSH_CUSTOM=$HOME/.zsh
source $ZSH_CUSTOM/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH_CUSTOM/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
zvm_after_init_commands+=('[ -f ~/.fzf ] && source ~/.fzf')

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt auto_cd


# PURE PROMPT SETUP
fpath+=$HOME/.zsh/themes/pure
autoload -U promptinit; promptinit
prompt pure
ZSH_THEME=""


# Auto ls after cd 
function chpwd() {
  exa -a -l 
}

# Aliases 
alias alac="nvim ~/.config/alacritty/alacritty.yml"
alias debug_alac="RUST_BACKTRACE=1 /Applications/Alacritty.app/Contents/MacOS/alacritty -vvv"
alias tmux_clean="tmux kill-server"
alias v="nvim"
alias zshc="nvim ~/.zshrc"
alias reload="source ~/.zshrc"
alias settings="nvim ~/.config/nvim/init.lua"
# alias code='open -b com.microsoft.VSCode "$@"'
alias ls="exa -a -l" 

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF CONFIGS
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export GATA_ROOT="$HOME/gataweb"
export TERM='screen-256color'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

