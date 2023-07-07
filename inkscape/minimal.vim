set ft=tex
set noshowmode

function! QuitAndPaste()
  let buffer_content = getline(1, '$')
  if join(buffer_content) == "$$"
    silent! execute "!osascript ~/.config/inkscape/paste.scpt false &"
  else
    normal ggVG"+y
    silent! execute "!osascript ~/.config/inkscape/paste.scpt true &"
  endif
  wq
endfunction

" Start insert mode between $$'s
autocmd BufEnter * startinsert | call cursor(1, 2)

"Text conceal
autocmd vimenter * ++nested set conceallevel=2
autocmd vimenter * ++nested set concealcursor=""
autocmd vimenter * ++nested hi! link VertSplit Comment

"Plugins
call plug#begin()
    "LSP related
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'j-hui/fidget.nvim'

    "Ultisnips
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    "Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'fhill2/telescope-ultisnips.nvim'
    Plug 'nvim-telescope/telescope-symbols.nvim'

    "Cmp
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    Plug 'onsails/lspkind.nvim'
    Plug 'kdheepak/cmp-latex-symbols'

    "Appearance
    Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }

    "QoL features
    Plug 'kylechui/nvim-surround'
    Plug 'windwp/nvim-autopairs'

    "Latex specific
    Plug 'lervag/vimtex'
    Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
call plug#end()

"Load relevant config parts from main config
source $HOME/.config/nvim/config/pywal.lua
source $HOME/.config/nvim/config/ultisnips.vim
source $HOME/.config/nvim/config/cmp.lua
source $HOME/.config/nvim/config/surround.lua
source $HOME/.config/nvim/config/autopairs.lua
source $HOME/.config/nvim/config/vimtex.vim

"Mappings
inoremap wq <Esc>:call QuitAndPaste()<CR>
nnoremap wq :call QuitAndPaste()<CR>
inoremap qw <Esc>:call QuitAndPaste()<CR>
nnoremap qw :call QuitAndPaste()<CR>



lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()

-- Keymap
local lsp_keymaps = function()
  local map = function(m, lhs, rhs)
    local opts = {remap = false, silent = true}
    vim.keymap.set(m, lhs, rhs, opts)
  end

  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  map('n', 'J', '<cmd>lua vim.diagnostic.open_float()<cr>')
  map('n', 'H', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  map('n', 'L', '<cmd>lua vim.diagnostic.goto_next()<cr>')
end

lsp_keymaps()

-- Enable float border
local _border = "single"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)
vim.diagnostic.config{
  float={border=_border}
}
require("mason-lspconfig").setup_handlers {}

require('telescope').setup {
    defaults = {
        color_devicons = true,
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
                ["<C-k>"] = "move_selection_previous",
                ["<C-j>"] = "move_selection_next",
            },
            n = {},
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        },
        buffers = {
            theme = "dropdown",
        },
        treesitter = {
            theme = "dropdown",
        },
        marks = {
            theme = "dropdown",
        },
    },
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>ts', builtin.symbols, {})
vim.keymap.set('i', '<C-s>', builtin.symbols, {})
EOF
