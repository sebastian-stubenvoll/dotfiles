nnoremap <silent> <leader>so :SymbolsOutlineOpen<CR>
nnoremap <silent> <leader>sc :SymbolsOutlineClose<CR>
nnoremap <silent> <leader>ss :SymbolsOutline<CR>

lua << EOF
vim.g.symbols_outline = {
    auto_preview = true,
    position = 'right',
}
EOF
