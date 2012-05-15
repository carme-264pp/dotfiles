#/bin/sh

mkdir -p $HOME/.vim/vim_backup/
mkdir -p $HOME/.vim/vim_swap/
ln -s $HOME/.vimrc ./.vimrc
ln -s $HOME/.zshrc ./.zshrc
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
