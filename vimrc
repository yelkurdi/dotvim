" Vundle and bundles configuration
source ~/dotvim/bundles.vim

syntax on
syntax spell toplevel

set history=200

set nocp
filetype indent plugin on     " required!

" Set gnuplot filetype
autocmd BufNewFile,BufRead *.gnu set filetype=gnuplot

" Exclude paths in file name completeion
" set wildignore+=/nls/p/*/

" Directory setup
set backupdir=~/dotvim/backup_files//
set directory=~/dotvim/swap_files//
" set undodir=~/dotvim/undo_files//

" Adjust comment style
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
autocmd FileType matlab setlocal commentstring=%\ %s

" Snips UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-g>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "myUltiSnippets"]
let g:snips_author="Yousef El-Kurdi"
let g:snips_instit="McGill University"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_UseMakefile=1
let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
"let g:Tex_ViewRule_pdf = 'xpdf -remote 127.0.0.1'
" Set the target format to pdf.
let g:Tex_MultipleCompileFormats='pdf,div,ps'
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
let g:Tex_IgnoreLevel  = 8
let g:tex_indent_brace = 0
let g:Tex_GotoError    = 0
let g:Tex_GotoError    = 0 " Does not work because of quickfix
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press Ctrl-N you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

" autocomple pop
let g:acp_behaviorKeywordLength = 5

" astyle
if !exists("g:formatprg_c") | let g:formatprg_c = "astyle" | endif
if !exists("g:formatprg_args_expr_c") && !exists("g:formatprg_args_c")
    let g:formatprg_args_expr_c = '"--style=allman --mode=c --pad-oper --convert-tabs --indent=spaces=4 --pad-header --max-code-length=80 --align-pointer=type --lineend=linux --suffix=none"'
endif

if !exists("g:formatprg_cpp") | let g:formatprg_cpp = "astyle" | endif
if !exists("g:formatprg_args_expr_cpp")  && !exists("g:formatprg_args_cpp")
    let g:formatprg_args_expr_cpp = '"--style=allman --mode=c --pad-oper --convert-tabs --indent=spaces=4 --pad-header --max-code-length=80 --align-pointer=type --lineend=linux --suffix=none"'
endif
let g:EclimCompletionMethod = 'omnifunc'
"Omnicomplete
let use_omnicomplete = 1
if use_omnicomplete
    if v:version >= 700
        set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin

        let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]
        let OmniCpp_DisplayMode         = 1
        let OmniCpp_GlobalScopeSearch   = 1
        let OmniCpp_MayCompleteArrow    = 1 " autocomplete after ->
        let OmniCpp_MayCompleteDot      = 1 " autocomplete after .
        let OmniCpp_MayCompleteScope    = 1 " autocomplete after ::
        let OmniCpp_NamespaceSearch     = 1
        let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
        let OmniCpp_ShowAccess          = 1 "show access in pop-up
        let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
        let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up

        " automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt=menuone,menu,longest,preview
        "set completeopt=menuone,menu,longest

        " Modify colors
        "highlight   clear
        "highlight   Pmenu         ctermfg=0 ctermbg=2
        "highlight   PmenuSel      ctermfg=0 ctermbg=7
        "highlight   PmenuSbar     ctermfg=7 ctermbg=0
        "highlight   PmenuThumb    ctermfg=0 ctermbg=7
    endif

    " ctags build map
    " function! UpdateTags()
    "     execute ":!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q -f .tags *"
    "     echohl StatusLine | echo "C/C++ tag updated" | echohl None
    " endfunction
    " nnoremap <C-F12> :call UpdateTags() <CR>
endif

" Map leader key
let mapleader = ","
noremap \ ,

" Map star key
nnoremap * *``

" Map compile keys
autocmd FileType c,cpp nmap <F9> :SCCompile -o %<.out<cr>
autocmd FileType c,cpp nmap <F10> :SCCompileRun -o %<.out<cr>

"Supertab
let g:SuperTabDefaultCompletionType = 'context'

"Syntastic
"let g:syntastic_c_checkers=['gcc']
"let g:syntastic_cpp_checkers=['gcc']
"let g:syntastic_check_on_open=1
"let g:syntastic_enable_signs=1

" colorshemes
" colorscheme desert
colorscheme wasabi256
" colorscheme wombat256mod
" colorscheme wombat256
set bg=dark


" scrolloff
set so=5

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" cmdline-completion
set wildmode=longest,list " This would emulate the typical shell completion

" case setupe
set ignorecase
set smartcase
set infercase
" set noignorecase infercase

" Thesaurus
" moby uses phrases witch contain spaces so account for them
" set thesaurus+=~/dotvim/thesaurus/mthesaur.nix
" Online Thesaurus
let g:online_thesaurus_map_keys = 0
nnoremap <leader>tt :OnlineThesaurusCurrentWord<CR>

" Persistent yank
vnoremap p pgvy

" Indentation 
set ts=2
set sw=2
set sts=4
set expandtab     " conversion of actual tab character (ctrl-v) to spaces
set smarttab
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs

" Text wrapping
"set linebreak nolist " break lines cleanly at word boundaries
set wrap
set linebreak
set nolist
"set showbreak= \ \ 
set showbreak=…

" Searching
set hlsearch
set incsearch
set wrapscan  " searches wrap bottom to top of file

" Dictionary
set dictionary+=/usr/share/dict/words

" Spelling
set spellfile=~/dotvim/dict.add
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

" Matching characters
" Closing braces
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap (      ()<Left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

" Folding
set foldmethod=syntax
nnoremap <Space> za
vnoremap <Space> za
nnoremap zO zCzO
"Modify default fold for gitcommit
autocmd Syntax gitcommit normal zR
autocmd FileType gitcommit set spell spelllang=en
"Default fold for text files
autocmd FileType text set foldmethod=indent

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
"vmap <D-j> gj
"vmap <D-k> gk
"vmap <D-4> g$
"vmap <D-6> g^
"vmap <D-0> g^
"nmap <D-j> gj
"nmap <D-k> gk
"nmap <D-4> g$
"nmap <D-6> g^
"nmap <D-0> g^
" map <F2> mzgg=G`z<CR>
noremap <F2> :Autoformat<CR><CR>
vmap <space> <C-w>

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

"set statusline=
"set statusline+=\[%n]                                  "buffernr
"set statusline+=\ %<%f\                                "file for File+path use: F
"set statusline+=\ \ %m%r%w\ \                          "Modified? Readonly? 
"set statusline+=\ %y\                                  "FileType
"set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}\     "Encoding
"set statusline+=\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
"set statusline+=\ %{&ff}\                              "FileFormat (dos/unix..) 
"set statusline+=\ %{&spelllang}\ %{HighlightSearch()}\  "Spellanguage & Highlight on?
"set statusline+=\ %=\ Line:%l/%L\ (%03p%%)\            "Linenumber/total (%)
"set statusline+=\ col:%03c\                            "Colnr

set statusline=
set statusline+=\[%n]                                  "buffernr
set statusline+=\ %<%f\                                "file for File+path use: F
set statusline+=\%{fugitive#statusline()}\             "Git current branch
set statusline+=\ \ %m%r%w\ \                          "Modified? Readonly? 
set statusline+=\ %y\                                  "FileType
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

" Set .tag files to html filetypes
autocmd BufNewFile,BufRead *.tag set filetype=html

" Set md file types
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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

" Python settings
" -----------------------------
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
let g:pymode_lint_ignore="E703"

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
" let g:pymode_folding = 0



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
