"Spelling
setlocal nospell
"set spelllang=
set spellsuggest=6
"Fix last mistake with first suggestion
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <C-l> [s1z=`]
"Cycle spell language
let g:SpellLanglist= ["de_de", "en_gb","en_us", ""]
let g:GrammarList= ["de-DE", "en-GB", "en-US", ""]
let g:grammarlang=""

function! SpellLangCycle()
    let l:lang_index = get(b:, 'lang_index', -1)
    let l:lang_index = (l:lang_index + 1) % len(g:SpellLanglist)
    let &spelllang = g:SpellLanglist[l:lang_index]
    let g:grammarlang = g:GrammarList[l:lang_index]
    let b:lang_index = l:lang_index
    if &spelllang == ""
        setlocal nospell
    else
        setlocal spell
    endif
endfunction

nmap <silent> <leader>ll :call SpellLangCycle()<CR>

let g:grammarous#convert_char_to_byte = 1

"Grammarous mappings"
function! GetGrammarousLang()
    return ':GrammarousCheck --lang=' . g:grammarlang . "\<CR>"
endfunction

nmap <leader>gw <Plug>(grammarous-move-to-info-window)
nmap <leader>go <Plug>(grammarous-open-info-window)
nmap <leader>gr <Plug>(grammarous-reset)
nmap <leader>gf <Plug>(grammarous-fixit)
nmap <leader>gc <Plug>(grammarous-close-info-window)
nmap <leader>gi <Plug>(grammarous-remove-error)
nmap <leader>gn <Plug>(grammarous-move-to-next-error)
nmap <leader>gp <Plug>(grammarous-move-to-previous-error)
nnoremap <silent> <expr> <leader>gg GetGrammarousLang()
nnoremap <leader>ls z=

