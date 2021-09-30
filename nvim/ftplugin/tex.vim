let g:tex_flavor = 'latex'
let g:tex_conceal='abdmgs'
let g:tex_fast='bcmMprsSvV'
hi texItalStyle gui=italic
hi texBoldStyle gui=bold
setlocal textwidth=80

nmap <silent> <localleader>to <plug>(vimtex-toc-open)
