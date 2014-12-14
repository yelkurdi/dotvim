#
echo "Executing setup"
CWD_MYVAR=$(pwd)
echo "PWD: " ${CWD_MYVAR}
set -o verbose
VIMDIR=~/dotvim
cd ${VIMDIR} 
ln -sf ${VIMDIR}/vimrc ~/.vimrc
ln -sf ${VIMDIR}/gvimrc ~/.gvimrc
git clone https://github.com/gmarik/vundle.git ${VIMDIR}/bundle/vundle
vim -u ${VIMDIR}/bundles.vim +PluginInstall +q +q

# for vim-latex to work
#ln -fs /home/yelkurdi/.vim/bundle/vim-latex/compiler compiler

cd $CWD_MYVAR
