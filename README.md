# Purpose

This repository contains a set of configuration files that power up my workflows

## Get started

After cloning this repo, you may want to create following symlinks in your
system. That way, when you execute these tools, they'll pick up the
configuration automatically.

```sh
# Let's assume that the dotfiles folder is located in the home directory

# zsh
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

# wezterm
ln -s $HOME/dotfiles/wezterm $HOME/.config/wezterm

# alacritty
ln -s $HOME/dotfiles/alacritty $HOME/.config/alacritty

# starship
ln -s $HOME/dotfiles/starship.toml $HOME/.config/starship.toml

# tmux
ln -s $HOME/dotfiles/.tmux.conf $HOME/.config/.tmux.conf

# vscode keybindings (Linux)
ln -s $HOME/dotfiles/vscode/linux-keybindings.json $HOME/.config/Code/User/keybindings.json

# vscode user settings (Linux)
ln -s $HOME/dotfiles/vscode/linux-settings.json $HOME/.config/Code/User/settings.json

```
