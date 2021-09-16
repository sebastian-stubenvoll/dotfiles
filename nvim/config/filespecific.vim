"Markdown
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown setlocal textwidth=80

"Tex
let g:tex_flavor = 'latex'
let g:tex_conceal='abdmgs'
let g:tex_fast='bcmMprsSvV'
hi texItalStyle gui=italic
hi texBoldStyle gui=bold
autocmd BufRead,BufNewFile,BufEnter *.tex setlocal textwidth=80



