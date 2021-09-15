"Gruvbox settings
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_termcolors = '256'
autocmd vimenter * ++nested colorscheme gruvbox 
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_ut=
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
