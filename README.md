## Neovim settings for Frontend Development

#### Installation(Linux Or Mac)
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) 
- [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- [vim-plug](https://github.com/junegunn/vim-plug) 
- [Tmux](https://github.com/tmux/tmux)
- clone this repo, place the files where it should be.
  - init.vim => ~/.config/nvim
  - .tmux.conf => ~/
  - my-snippets => ~/.config/nvim/my-snippets
  - .zshrc => ~/

#### plugin requirements
 ##### fzf: 
 - I needed to install the package call [fd](https://github.com/sharkdp/fd) manually
 - check my .zshrc, for the fzf env variables 

 ##### ale:
 - To make this faster, I needed to install [Fast Fold](https://github.com/Konfekt/FastFold) under ~/.config/nvim/plugged
 - ale will work properly if  your project has settings for `eslint` or `eslint` with `prettier`
 

