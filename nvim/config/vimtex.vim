let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_view_method = 'sioyek'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_compiler_progname = 'lualatex'

let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-lualatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}


"Filter out some warnings that inevitably occur because I'm not a latex wizard
let g:vimtex_quickfix_ignore_filters = [
    \'Underfull \\hbox (badness [0-9]*) in ',
    \'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in '
    \'LaTeX hooks Warning'
\]


