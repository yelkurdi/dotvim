#
echo "Executing setup"
CWD_MYVAR=$(pwd)
echo "PWD: " ${CWD_MYVAR}
set -o verbose
cd ~/.vim
ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/gvimrc ~/.gvimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -u ~/.vim/bundles.vim +PluginInstall +q +q

# for vim-latex to work
#ln -fs /home/yelkurdi/.vim/bundle/vim-latex/compiler compiler
cd ~/.vim/tags/
tar xjf cpp_src.tar.bz2
./runCtags.sh
rm -rf cpp_src
cd $CWD_MYVAR
