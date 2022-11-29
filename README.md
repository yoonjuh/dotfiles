# Dev environment setup for personal use

This repository contains a set of configuration files that power up my day-to-day experience as a developer.
The target languages for the neovim configuration are Javascript, Typescript, go and lua.

## Prerequisites for the configurations 

This configuration requires a lot dependencies. Please make sure you install following packages on your system. 
If you don't see the version number besides the name, it won't matter as long as you install the latest version of it.

- git
- zsh
  - With the current config, it requires `fast-syntax-highlighting` to be installed in the `$HOME/.zsh/plugins`
- starship prompt
- python3
- go
- ripgrep
- fd
- bat
- neovim ^0.8.*
- treesitter (cli)
- wezterm (or alacritty)
  - In case you installed wezterm, installing wezterm cli would be helpful to use this terminal
- tmux 
  - alacritty does not support multiplexing features so you might need this for it
- packer 
  - plugin manager for neovim
- cargo 
  - This might not be required but it will be helpful to install other packages that are written in Rust

## Configuration placements on your system

I am using these files by creating symlink for each of them. It might be differ based on your OS but following places generally works for Linux and MacOS.


```sh
# Let's assume that the dotfiles folder is located in the home directory

# zsh
ln -s $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc

# wezterm
ln -s $HOME/dotfiles/wezterm $HOME/.config/wezterm

# alacritty
ln -s $HOME/dotfiles/alacritty $HOME/.config/alacritty

# neovim
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim

# starship
ln -s $HOME/dotfiles/starship.toml $HOME/.config/starship.toml

# tmux 
ln -s $HOME/dotfiles/tmux.conf.symlink $HOME/.config/.tmux.conf

```

## Neovim plugin install 

Once you installed neovim, please ensure there is no major issue on the `:checkhealth` command in your neovim session. 
If it complains, please install the required packages. But If you installed the packages listed above, you should be good to go!


As a next step, you can execute `:PackerInstall` in a neovim session. This will install all the neovim plugins. 
Then, next time when you open up a nvim session, it will start installing language servers.

## Note

This configuratinos are pretty stable I think, but there are lots of room for improvements.

