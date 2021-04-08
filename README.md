# Installation

This config is written for NeoVim but should work with recent versions of Vim

```sh
git clone git@github.com:tuxmachine/vim-config.git ~/.config/nvim
ln -s $HOME/.config/nvim $HOME/.vim
brew install fzf ripgrep delta bat
```

Start vim and run:

```vim
:PlugInstall
:CocUpdate
```
