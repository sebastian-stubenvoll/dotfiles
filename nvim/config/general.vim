set nu
set nocompatible
set relativenumber
set path+=**
set wildmenu
set backspace=start,eol,indent
set hidden
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent
set pumheight=5
set background=dark

syntax on
filetype plugin indent on

"Text Highlighting
autocmd vimenter * ++nested hi clear SpellBad 
autocmd vimenter * ++nested hi SpellBad  ctermfg=9  guifg=#fb4934 gui=undercurl
autocmd vimenter * ++nested hi clear texItalStyle
autocmd vimenter * ++nested hi texItalStyle gui=italic 
autocmd vimenter * ++nested hi clear texBoldStyle
autocmd vimenter * ++nested hi texBoldStyle gui=bold

"Text conceal
autocmd vimenter * ++nested set conceallevel=2
autocmd vimenter * ++nested set concealcursor=""

"Buffer mappings
"Listing buffers is done with ctrlp (see ctrlp.vim)
nnoremap <silent> <C-b>b :bp<CR>
nnoremap <silent> <C-b>n :bn<CR>
nnoremap <silent> <C-b>d :bd<CR>
nnoremap <silent> gb :bn<CR>
nnoremap <silent> gB :bp<CR>

"CursorLine highglighting doesn't look to good with a lot of wal schemes
augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight CursorLine cterm=italic ctermfg=7 ctermbg=0 guibg=Grey40
augroup END
