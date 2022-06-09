#/bin/sh

mkdir -p $HOME/.vim/vim_backup/
mkdir -p $HOME/.vim/vim_swap/
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
