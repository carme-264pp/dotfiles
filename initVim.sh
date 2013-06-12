#/bin/sh

mkdir -p $HOME/.vim/vim_backup/
mkdir -p $HOME/.vim/vim_swap/
mkdir -p $HOME/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
