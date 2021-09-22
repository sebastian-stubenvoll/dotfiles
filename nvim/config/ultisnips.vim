"Ultisnips bindings now in Coc
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Math regions for markdown files
"required for some tex snippets
function! MathAndLiquid()
    "" Define certain regions
    " Block math. Look for "$$[anything]$$"
    syn region math start=/\$\$/ end=/\$\$/
    " inline math. Look for "$[not $][anything]$"
    syn match math_block '\$[^$].\{-}\$'

    "" Actually highlight those regions.
    hi link math Statement
    hi link math_block Function
endfunction

" Call everytime we open a Markdown file
" This adds the mathzone text object, so UltiSnips knows when to expand the
" borrowed tex snippets
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()

