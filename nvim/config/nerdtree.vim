"Nerd Tree toggle
map <C-n> :NERDTreeToggle<CR>

" Nerd Tree Visuals
let g:WebDevIconsDefaultFolderSymbolColor = '83A598'
let NERDTreeDirArrowExpandable = "\u00a0" "non breaking space
let NERDTreeDirArrowCollapsible = "\u00a0" "non breaking space
autocmd vimenter * ++nested hi clear NERDTreeDir
autocmd vimenter * ++nested hi NERDTreeDir guifg=#EBDBB2
autocmd vimenter * ++nested hi clear NERDTreeDirSlash
autocmd vimenter * ++nested hi NERDTreeDirSlash guifg=#EBDBB2
autocmd vimenter * ++nested hi clear NERDTreeCWD
autocmd vimenter * ++nested hi NERDTreeCWD guifg=#83A598

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "!",
    \ "Staged"    : "✚",
    \ "Untracked" : "\u00a0",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '\u00a0',
    \ "Unknown"   : "?"
    \ }
