-- Set up nvim-cmp.
local cmp = require'cmp'
local cmp_ultisnips_mappings = require'cmp_nvim_ultisnips.mappings'
local lspkind = require'lspkind'

cmp.setup({
    preselect =cmp.PreselectMode.None,
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
    mapping = {
        -- scroll docs
        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-g>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        -- confirm selection
        ["<Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.compose { "expand", "jump_forwards" }(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
        ["<S-Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.compose { "expand", "jump_backwards" }(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),

        -- navigate items on the list
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'latex_symbols' },
        })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<Tab>'] = cmp.mapping.confirm(),
    },
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<Tab>'] = cmp.mapping.confirm(),
    },
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        })
})
