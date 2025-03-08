local walcols = require('lualine.themes.pywal')
walcols.inactive.c.fg = walcols.normal.b.bg

require('lualine').setup {
    options = {
        theme = walcols,
        icons_enabled = true,
        --component_separators = { left = '', right = '' },
        --section_separators = { left = '', right = '' },
        component_separators = '',
        section_separators = '',
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { "filename", "diff" },
        lualine_x = {
            'diagnostics', 'filesize', 'fileformat', '%{&spelllang}', {
                'filetype',
                colored = true
            },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_c = {},
        lualine_b = {},
        lualine_a = { 'filename', 'diff'
        },
        lualine_z = { 'location' },
        lualine_y = {},
        lualine_x = {}
    },
    tabline = {
        --lualine_a = {},
        lualine_c = {
            '%=',
            { 'buffers',
                symbols = {
                    modified = ' +', -- Text to show when the buffer is modified
                    alternate_file = '', -- Text to show to identify the alternate file
                    directory = '', -- Text to show when the buffer is a directory
                },
                buffers_color = {
                    -- Same values as the general color option can be used here.
                    active = 'lualine_a_normal',     -- Color for active buffer.
                    inactive = 'lualine_a_inactive', -- Color for inactive buffer.
                },
                mode = 4,
            }
        },
        --lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'tabs' }
    },
    extensions = { 'fugitive', 'quickfix' }
}
