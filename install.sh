#
PKGLIST="texlive vim-latexsuite exuberant-ctags"
sudo apt-get install $PKGLIST
sudo vim-addons -w install latex-suite

cd ~/.vim
ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/gvimrc ~/.gvimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -u ~/.vim/bundles.vim +PluginInstall +q +q
cd ~/.vim/tags/
tar xjf cpp_src.tar.bz2
./runCtags.sh
rm -rf cpp_src
cd ..
