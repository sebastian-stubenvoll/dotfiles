let g:tex_flavor = 'latex'
let g:tex_conceal='abdmgs'
let g:tex_fast='bcmMprsSvV'
hi texItalStyle gui=italic
hi texBoldStyle gui=bold
setlocal textwidth=80

"vimtex mappings
nmap <silent> <localleader>to <plug>(vimtex-toc-open)
nmap <silent> <localleader>s <plug>(vimtex-view)
nmap <silent> <localleader>r <plug>(vimtex-compile)
nmap <silent> <localleader>e <plug>(vimtex-errors)
nmap <silent> <localleader>o <plug>(vimtex-compile-output)
nmap <silent> <localleader>c <plug>(vimtex-clean)
nmap <silent> <localleader>C <plug>(vimtex-clean-full)
nmap <silent> <localleader>q <plug>(vimtex-stop)
nmap <silent> <localleader>Q <plug>(vimtex-stop-all)
