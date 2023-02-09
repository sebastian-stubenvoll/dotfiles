-- Set up nvim-cmp.
local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
    requires = {{ "kdheepak/cmp-latex-symbols" }},
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    window = {
        completion = {
            border = 'single',
            scrollbar = false,
        },
        documentation = {
            border = 'single',
            scrollbar = false,
        },
    },
    formatting = {
        format = lspkind.cmp_format(),
    },
    mapping = cmp.mapping.preset.insert({
        -- scroll docs
        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-g>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        -- confirm selection
        ['<TAB>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.


        -- navigate items on the list
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'latex_symbols' },
    }, {
            { name = 'buffer' },
        })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        })
})
