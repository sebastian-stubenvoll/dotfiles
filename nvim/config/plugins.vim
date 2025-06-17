call plug#begin()

"LSP related
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'j-hui/fidget.nvim'

" Snippets
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} 
Plug 'rafamadriz/friendly-snippets'

"Obsidian
Plug 'epwalsh/obsidian.nvim'

""Tresitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-context'

""Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'benfowler/telescope-luasnip.nvim'
Plug 'nvim-telescope/telescope-bibtex.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'

""Harpoon
Plug 'ThePrimeagen/harpoon'

""Cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind.nvim'
Plug 'kdheepak/cmp-latex-symbols'

""Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

""Appearance
Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }
Plug 'navarasu/onedark.nvim'
Plug 'nvim-lualine/lualine.nvim', { 'commit' : '2248ef254d0a1488a72041cfb45ca9caada6d994'}
Plug 'kyazdani42/nvim-web-devicons'

""QoL features
Plug 'preservim/nerdcommenter'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'kylechui/nvim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'stevearc/aerial.nvim'

""Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'

""Language specific
Plug 'simrat39/rust-tools.nvim'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'artur-shaik/vim-grammarous', {'branch': 'byte-to-char'}
Plug 'deanashton/vim-deckset'
Plug 'plasticboy/vim-markdown'

""Development
Plug 'folke/neodev.nvim'

call plug#end()
