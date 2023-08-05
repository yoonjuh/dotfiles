export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export GOPATH=$HOME/go

# Reduce the delay after you press <ESC>
export KEYTIMEOUT=5

# PLUGINS
export ZSH_CUSTOM=$HOME/.zsh
source $ZSH_CUSTOM/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
#source $ZSH_CUSTOM/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
#zvm_after_init_commands+=('[ -f ~/.fzf ] && source ~/.fzf')

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt auto_cd
ZSH_THEME=""

# Auto ls after cd 
function chpwd() {
  exa -a -l 
}

function open () {
  xdg-open $* > /dev/null 2>&1
}

# fzf keybainding setup on Fedora
if [ -x "$(command -v fzf)"  ]
then
    source /usr/share/fzf/shell/key-bindings.zsh
fi

# Aliases 
alias alac="nvim ~/.config/alacritty/alacritty.yml"
alias debug_alac="RUST_BACKTRACE=1 /Applications/Alacritty.app/Contents/MacOS/alacritty -vvv"
alias tmux_clean="tmux kill-server"
alias v="nvim"
alias zshc="nvim ~/.zshrc"
alias reload="source ~/.zshrc"
alias settings="nvim ~/.config/nvim/init.lua"
alias ls="exa -a -l" 
alias starship_conf="nvim ~/.config/starship.toml"
alias wezconf="nvim ~/.config/wezterm/wezterm.lua"

# FZF CONFIGS
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export TERM='screen-256color'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#. "$HOME/.cargo/env"
#[[ -s "/home/edwinyoon/.gvm/scripts/gvm" ]] && source "/home/edwinyoon/.gvm/scripts/gvm"

eval "$(starship init zsh)"

