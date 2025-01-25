call plug#begin()

"LSP related
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'j-hui/fidget.nvim'

"Ultisnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Tresitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-context'

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'fhill2/telescope-ultisnips.nvim'
Plug 'nvim-telescope/telescope-bibtex.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'

"Harpoon
Plug 'ThePrimeagen/harpoon'

"Cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'onsails/lspkind.nvim'
Plug 'kdheepak/cmp-latex-symbols'

"Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

"Appearance
Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }
Plug 'navarasu/onedark.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

"QoL features
Plug 'preservim/nerdcommenter'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'kylechui/nvim-surround'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'stevearc/aerial.nvim'

"Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'

"Language specific
Plug 'simrat39/rust-tools.nvim'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'artur-shaik/vim-grammarous', {'branch': 'byte-to-char'}
Plug 'deanashton/vim-deckset'
Plug 'plasticboy/vim-markdown'

"Development
Plug 'folke/neodev.nvim'

call plug#end()
