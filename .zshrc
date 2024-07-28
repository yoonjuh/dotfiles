export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export GOPATH=$HOME/go

# Reduce the delay after you press <ESC>
export KEYTIMEOUT=5

# PLUGINS
export ZSH_CUSTOM=$HOME/.zsh
source $ZSH_CUSTOM/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# This is a dependency of colored-man-pages
source $ZSH_CUSTOM/ohmyzsh/lib/theme-and-appearance.zsh
source $ZSH_CUSTOM/ohmyzsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt auto_cd
ZSH_THEME=""

# Auto ls after cd 
function chpwd() {
  eza -a -l 
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
alias alac="nvim ~/.config/alacritty/alacritty.toml"
alias debug_alac="RUST_BACKTRACE=1 /Applications/Alacritty.app/Contents/MacOS/alacritty -vvv"
alias tmux_clean="tmux kill-server"
alias v="nvim"
alias zshc="nvim ~/.zshrc"
alias reload="source ~/.zshrc"
alias settings="nvim ~/.config/nvim/init.lua"
alias ls="eza -a -l" 
alias starship_conf="nvim ~/.config/starship.toml"
alias wezconf="nvim ~/.config/wezterm/wezterm.lua"

# FZF CONFIGS
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# load starship
eval "$(starship init zsh)"
