" Vundle settings start
"*****************************
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'nelstrom/vim-visual-star-search.git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'godlygeek/tabular.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'tpope/vim-surround.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'Rip-Rip/clang_complete'
"Bundle 'tpope/vim-dispatch.git'
"Bundle 'Valloric/YouCompleteMe.git'
Bundle 'msanders/snipmate.vim.git'
Bundle 'ervandew/supertab.git'
Bundle 'vim-scripts/taglist.vim.git'
"Bundle 'scrooloose/syntastic.git'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
"Bundle 'djoshea/vim-matlab-fold.git'
Bundle 'lazywei/vim-matlab.git'
Bundle 'vim-scripts/Colour-Sampler-Pack.git'
"Bundle 'vim-scripts/octave.vim--.git'
" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...
Bundle 'xuhdev/SingleCompile.git'

filetype on
filetype indent plugin on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

" Vundle settings ends
"*****************************
