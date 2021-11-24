""""""""""""""""""""""
"  GENERIC SETTINGS  "
""""""""""""""""""""""
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

"""""""""""""""""""""""""
"  SYNTAX AND FILETYPE  "
"""""""""""""""""""""""""
syntax on
filetype plugin indent on

"""""""""""""
"  VISUALS  "
"""""""""""""
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

"CursorLine highglighting doesn't look to good with a lot of wal schemes
augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight CursorLine cterm=italic ctermfg=7 ctermbg=0 guibg=Grey40
augroup END

""""""""""""""
"  MAPPINGS  "
""""""""""""""
"Unbind # so localleader timeout doesn't randomly highlight stuff
noremap # <Nop>

"Set leaders
let mapleader = " "
let maplocalleader = "#"

"Buffer mappings
"Listing buffers is done with fzf (see fzf.vim)
nnoremap <silent> <leader>bb :bp<CR>
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> gb :bn<CR>
nnoremap <silent> gB :bp<CR>

"More accesible macro mapping
nnoremap m @

"Alternative window bindings!
nnoremap <leader>w <C-w>

"Clear highlight binding
nnoremap <silent> <leader>hc :noh<CR>

"Paragraph mappings
nnoremap ü {
nnoremap + }

"Section mappings
nnoremap Ü [
nnoremap * ]

"Add back goto start of next line
nnoremap ö +
