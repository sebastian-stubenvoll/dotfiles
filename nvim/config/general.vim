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
nnoremap <C-b>b :bp<CR>
nnoremap <C-b>n :bn<CR>
nnoremap <C-b>d :bd<CR>

