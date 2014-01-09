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
"Bundle 'vim-scripts/octave.vim--.git'
" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

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


syntax on
syntax spell toplevel

" Set for clang_complete
" ******************************
"inoremap <C-Y> <C-O>dd
let g:clang_library_path = '/usr/lib/llvm-3.4/lib'
let g:clang_complete_auto = 1
let g:clang_use_library=1
"let g:clang_debug = 1
"let g:clang_user_options = '-std=c++11'
"******************************

set history=200

" Map leader key
let mapleader = ","
noremap \ ,

"Supertab
let g:SuperTabDefaultCompletionType = 'context'

"Syntastic
"let g:syntastic_c_checkers=['gcc']
"let g:syntastic_cpp_checkers=['gcc']
"let g:syntastic_check_on_open=1
"let g:syntastic_enable_signs=1

" YCM configuration
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" colorshemes
colorscheme desert
set bg=light

" scrolloff
set so=5

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
set list

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" cmdline-completion
set wildmode=longest,list " This would emulate the typical shell completion

" case setupe
set ignorecase smartcase
" set noignorecase infercase

" Thesaurus
" path to the moby thesaurus
"set thesaurus+=/home/yelkurdi/.vim/thesaurus/mthesaurus.nix
" moby uses phrases witch contain spaces so account for them
"set iskeyword+=32-127,^,

" Persistent yank
xnoremap p pgvy

" Tabs
map :tn :tabnext
map :tp :tabprevious

" Indentation 
set ts=4
set sw=4
set sts=4
set expandtab     " conversion of actual tab character (ctrl-v) to spaces
set smarttab
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs

" Text wrapping
set wrap
set showbreak=>>\ \ 
"set linebreak nolist " break lines cleanly at word boundaries

" Searching
set hlsearch
set incsearch
set wrapscan  " searches wrap bottom to top of file

" Spelling
set spellfile=~/.vim/dict.add
au BufNewFile,BufRead,BufEnter *.tex setlocal spell spelllang=en_us
au BufNewFile,BufRead,BufEnter *.txt setlocal spell spelllang=en_us

" Visual indicators
nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
    if !exists('w:longlinehl')
        let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
        echo "Long lines highlighted"
    else
        call matchdelete(w:longlinehl)
        unl w:longlinehl
        echo "Long lines unhighlighted"
    endif
endfunction
" Activating highlights indicator after column 80 
au BufWinEnter *.{c,cc,cpp,h,hpp} let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)

" Add line numbers per line
set number

" Closing braces
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" Folding
"set foldmethod=syntax
nnoremap <Space> za
vnoremap <Space> za
nnoremap zO zCzO

function! s:insert_gates()
    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal! i#ifndef " . gatename
    execute "normal! o#define " . gatename . " "
    execute "normal! Go#endif /* " . gatename . " */"
    normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" Key mapings
" Indent all
" Exit insert mode
:imap jj <Esc>
map <F2> mzgg=G`z<CR>
" Inserting a line above in normal mode
map <S-Enter> O<Esc>
" For local variable renaming
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>
" For global variable renaming
nnoremap gR gD:%s/<C-R>///gc<left><left><left>}
"nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Highilighting status line based on mode
" first, enable status line always
set laststatus=2

set statusline=
set statusline+=\[%n]                                  "buffernr
set statusline+=\ %<%f\                                "file for File+path use: F
set statusline+=\ \ %m%r%w\ \                          "Modified? Readonly? 
set statusline+=\ %y\                                  "FileType
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}\     "Encoding
set statusline+=\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=\ %{&spelllang}\ %{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=\ %=\ Line:%l/%L\ (%03p%%)\            "Linenumber/total (%)
set statusline+=\ col:%03c\                            "Colnr

function! HighlightSearch()
    if &hls
        return 'H'
    else
        return ''
    endif
endfunction
"
hi User0 guifg=#ffffff  guibg=#094afe ctermfg=White ctermbg=Black
hi User1 guifg=#ffdad8  guibg=#880c0e ctermfg=Black ctermbg=Black
hi User2 guifg=#000000  guibg=#F4905C ctermfg=Black ctermbg=Cyan
hi User3 guifg=#292b00  guibg=#f4f597 ctermfg=Black ctermbg=LightRed
hi User4 guifg=#112605  guibg=#aefe7B ctermfg=Black ctermbg=LightGreen
hi User5 guifg=#051d00  guibg=#7dcc7d ctermfg=Black ctermbg=Green
hi User7 guifg=#ffffff  guibg=#880c0e ctermfg=White ctermbg=Blue
hi User8 guifg=#ffffff  guibg=#5b7fbb ctermfg=White ctermbg=Blue
hi User9 guifg=#ffffff  guibg=#810085 ctermfg=White ctermbg=Magenta
"
" now set it up to change the status line based on mode
if version >= 700
    au InsertEnter * hi StatusLine term=reverse ctermfg=Yellow ctermbg=Black gui=bold guifg=Black guibg=Yellow
    au InsertLeave * hi StatusLine term=reverse ctermfg=White ctermbg=Black gui=bold guifg=Black guibg=White
endif

" Loading custom vim settings for different projects
au BufNewFile,BufRead *.{c,cc,cpp,h,hpp} call CheckForCustomConfiguration()

function! CheckForCustomConfiguration()
    " Check for .vim.custom in the directory containing the newly opened file
    let custom_config_file = expand('%:p:h') . '/.vim.custom'
    if filereadable(custom_config_file)
        exe 'source' custom_config_file
    endif
endfunction

" Gui options for gvim
" :set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar

" Special file types
au BufNewFile,BufRead *.geo setf c "Set c syntax for gmsh geo files

" vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
"let g:Tex_ViewRule_pdf = 'xpdf -remote 127.0.0.1'
" Set the target format to pdf.
let g:Tex_DefaultTargetFormat = 'pdf' 
let g:Tex_MultipleCompileFormats='div, pdf, ps'
" Set the warning messages to ignore.
let g:Tex_IgnoredWarnings =
            \"Underfull\n".
            \"Overfull\n".
            \"specifier changed to\n".
            \"You have requested\n".
            \"Missing number, treated as zero.\n".
            \"There were undefined references\n".
            \"Citation %.%# undefined\n".
            \'LaTeX Font Warning:'"
" This number N says that latex-suite should ignore the first N of the above.
let g:Tex_IgnoreLevel = 8
let g:tex_indent_brace=0
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press Ctrl-N you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:


" Only do this part when compiled with support for autocommands
if has("autocmd")
    " Enable file type detection
    filetype on

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " Customisations based on house-style (arbitrary)
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType tex setlocal ts=4 sts=4 sw=4 noexpandtab

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" Set matlab file type .param in Getfem
"autocmd BufNewFile,BufRead *.param set filetype=octave
"autocmd BufNewFile,BufRead *.m set filetype=octave
autocmd BufNewFile,BufRead *.param set filetype=matlab

nnoremap <silent> <F3> :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete " delete old fugitive buffers

" Tabularize mappings
let mapleader=','
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

" The custom :Qargs command sets the arglist to contain each of the files referenced by the quickfix list.
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
    " Building a hash ensures we get each buffer only once
    let buffer_numbers = {}
    for quickfix_item in getqflist()
        let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
    endfor
    return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEEP THIS AT END OF .vimrc
"
" Set directory-wise configuration.
" Search from the directory the file is located upwards to the root for
" a local configuration file called .lvimrc and sources it.
"
" The local configuration file is expected to have commands affecting
" only the current buffer.

function! SetLocalOptions(fname)
    let dirname = fnamemodify(a:fname, ":p:h")
    while "/" != dirname
        let lvimrc  = dirname . "/.lvimrc"
        if filereadable(lvimrc)
            execute "source " . lvimrc
            break
        endif
        let dirname = fnamemodify(dirname, ":p:h:h")
    endwhile
endfunction

au BufNewFile,BufRead * call SetLocalOptions(bufname("%"))

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
