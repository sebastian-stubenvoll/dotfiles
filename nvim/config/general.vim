"Generic settings
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
set completeopt=menu,menuone,noselect
set mouse=
set fillchars=stl:  "this contains an em space!
set signcolumn=yes:1

"Provider settings
let g:python_host_prog="/usr/bin/python"

"Syntax settings
syntax on
filetype plugin indent on

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
nnoremap Q @

"Marks mappings
nnoremap ß `

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

"Simplify window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

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

autocmd vimenter * ++nested hi! link VertSplit Comment


