local custom_pywal = require 'lualine.themes.pywal'
custom_pywal.normal.a.fg = nil
custom_pywal.normal.c.bg = nil
custom_pywal.insert.a.fg = nil
custom_pywal.visual.a.fg = nil
custom_pywal.replace.a.fg = nil
custom_pywal.inactive.c.bg = nil

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_pywal,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
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
    lualine_c = { 'filename', {
      'diff', diff_color = {
        -- Same color values as the general color option can be used here.
        added    = 'DiffAdd', -- Changes the diff's added color
        modified = 'DiffChange', -- Changes the diff's modified color
        removed  = 'DiffDelete', -- Changes the diff's removed color you
      }
    } },
    lualine_x = { {
      'diagnostics',
      diagnostics_color = {
        -- Same values as the general color option can be used here.
        error = 'DiagnosticError', -- Changes diagnostics' error color.
        warn  = 'DiagnosticWarn', -- Changes diagnostics' warn color.
        info  = 'DiagnosticInfo', -- Changes diagnostics' info color.
        hint  = 'DiagnosticHint', -- Changes diagnostics' hint color.
      },
    }, 'encoding', 'fileformat', {
      'filetype',
      colored = false
    },
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename', {
      'diff', diff_color = {
        -- Same color values as the general color option can be used here.
        added    = 'DiffAdd', -- Changes the diff's added color
        modified = 'DiffChange', -- Changes the diff's modified color
        removed  = 'DiffDelete', -- Changes the diff's removed color you
      }}
    },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {
      {
        'buffers',
        symbols = {
          modified = ' ●', -- Text to show when the buffer is modified
          alternate_file = '', -- Text to show to identify the alternate file
          directory = '', -- Text to show when the buffer is a directory
        }
      }
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'tabs' }
  },
  extensions = { 'symbols-outline', 'fzf' }
}
