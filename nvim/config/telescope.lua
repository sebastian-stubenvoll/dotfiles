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
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('bibtex')
require("telescope").load_extension("git_worktree")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<leader>tm', builtin.marks, {})
vim.keymap.set('n', '<C-m>', builtin.marks, {})
vim.keymap.set('n', '<leader>tl', builtin.live_grep, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tt', builtin.treesitter, {})
vim.keymap.set('n', '<leader>tk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>tgb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>tgc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>tgs', builtin.git_stash, {})
vim.keymap.set('n', '<leader>ts', builtin.symbols, {})
vim.keymap.set('i', '<C-s>', builtin.symbols, {})
vim.keymap.set('n', '<leader>tgw', require('telescope').extensions.git_worktree.git_worktrees, {})
vim.keymap.set('n', '<leader>tgn', require('telescope').extensions.git_worktree.create_git_worktree, {})







