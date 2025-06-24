-- Set up nvim-cmp.
local cmp = require'cmp'
local lspkind = require'lspkind'
local luasnip = require'luasnip'

cmp.setup({
    preselect =cmp.PreselectMode.None,
    requires = {{ "kdheepak/cmp-latex-symbols" }},
    snippet = {
        expand = function(args)
          require'luasnip'.lsp_expand(args.body)
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
    mapping = {
        -- scroll docs
        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-g>'] = cmp.mapping.scroll_docs(4),
        ['<C-c>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping(function(fallback) -- needed so cmp doesn't consume tab presses
                fallback()
        end),
        ['<C-o>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if luasnip.expandable() then
                    luasnip.expand()
                else
                    cmp.config({
                        select = true,
                    })
                end
            else
                fallback()
            end
        end),
        -- navigate items on the list
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip', option = { use_show_condition = false, show_autosnippets = false } },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'latex_symbols' },
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
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
