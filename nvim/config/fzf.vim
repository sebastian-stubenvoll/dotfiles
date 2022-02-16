"Bindings
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-s> :Snippets<CR>
nnoremap <silent> <C-w> :Windows<CR>
nnoremap <silent> <C-m> :Marks<CR>
nnoremap <silent> <C-t> :Tabs<CR>
inoremap <silent> <C-s> <C-\><C-O>:Snippets<CR>

"Colours
let g:fzf_colors =                                                                         
      \ { 'fg':      ['fg', 'Normal'],                                                           
      \ 'bg':      ['bg', 'Normal'],                                                           
      \ 'hl':      ['fg', 'Comment'],                                                          
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],                             
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],                                       
      \ 'hl+':     ['fg', 'Statement'],                                                        
      \ 'info':    ['fg', 'PreProc'],                                                          
      \ 'border':  ['fg', 'Comment'],                                                           
      \ 'prompt':  ['fg', 'Conditional'],                                                      
      \ 'pointer': ['fg', 'Exception'],                                                        
      \ 'marker':  ['fg', 'Keyword'],                                                          
      \ 'spinner': ['fg', 'Label'],                                                            
      \ 'header':  ['fg', 'Comment'] } 

