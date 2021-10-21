let g:vimtex_fold_enabled = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'

"Filter out some warnings that inevitably occur because I'm not a latex wizard
let g:vimtex_quickfix_ignore_filters = [
    \'Underfull \\hbox (badness [0-9]*) in ',
    \'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in '
\]
