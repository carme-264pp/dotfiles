#!/bin/sh
if [ -e $HOME/.vimrc ]; then
	mv $HOME/.vimrc $HOME/.vimrc.old.`date "+%y%m%d%H%M%S"`
fi
ln -s `pwd`/vimrc $HOME/.vimrc

if [ -e $HOME/.zshrc ]; then
	mv $HOME/.zshrc $HOME/.zshrc.old.`date "+%y%m%d%H%M%S"`
fi
ln -s `pwd`/zshrc $HOME/.zshrc

if [ -e $HOME/.gitconfig ]; then
	mv $HOME/.gitconfig $HOME/.gitconfig.old.`date "+%y%m%d%H%M%S"`
fi
ln -s `pwd`/gitconfig $HOME/.gitconfig
