require("mason").setup()
require("mason-lspconfig").setup()
require"fidget".setup{
    progress = {
      display = {
        progress_icon = { pattern = "dots", period = 1 },
        done_icon = "✔",               -- character shown when all tasks are complete
      },
    },
}

-- Specfic LSP options

local rust_tools_opts = {
  tools = {
    autoSetHints = true,
    inlay_hints = {
      only_current_line = false,
      show_parameter_hints = true,
	  show_variable_name = false,
	  parameter_hints_prefix = " ",
	  other_hints_prefix = " ",
	  highlight = "String",
    },
  },
}

-- Keymap
local lsp_keymaps = function()
  local map = function(m, lhs, rhs)
    local opts = {remap = false, silent = true}
    vim.keymap.set(m, lhs, rhs, opts)
  end

  -- LSP actions
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
  map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
  map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
  map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  map('x', '<leader>a', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

  -- Diagnostics
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


--Setup handlers

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["rust_analyzer"] = function ()
        require("rust-tools").setup(rust_tools_opts)
    end
}

vim.filetype.add({
    pattern = {
      ['.*%.wgsl'] = 'wgsl',
    },
})
