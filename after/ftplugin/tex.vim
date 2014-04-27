call IMAP('FEM', 'FEM', 'tex')
call IMAP('EDO', 'EDO', 'tex')
call IMAP('ECE', 'ECE', 'tex')
if g:Tex_UseMakefile
    set makeprg=make
endif
