lua <<EOF

local command = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd
local user_cmds = vim.api.nvim_create_augroup('user_cmds', {clear = true})
local util = {}

local lsp_install = require('nvim-lsp-installer')
local lspconfig = require('lspconfig')

local rust_tools_opts = {
  tools = { 
    autoSetHints = true,
    hover_with_actions = true,
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

local lsp_keymaps = function(bufnr)
  local map = function(m, lhs, rhs)
    local opts = {remap = false, silent = true, buffer = bufnr}
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

local lsp_diagnostic = function()
  local sign = function(opts)
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = ''
    })
  end

  sign({name = 'DiagnosticSignError', text = ''})
  sign({name = 'DiagnosticSignWarn', text = ''})
  sign({name = 'DiagnosticSignHint', text = '⚑'})
  sign({name = 'DiagnosticSignInfo', text = ''})

  vim.diagnostic.config({
    virtual_text = true,
    signs = false,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  })
end

local lsp_capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local lsp_setup = function(server, opts)
  opts.capabilities = lsp_capabilities

  opts.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    local buf_command = vim.api.nvim_buf_create_user_command

    buf_command(bufnr, 'LspFormat', function()
      vim.lsp.buf.formatting()
    end, {desc = 'Format buffer with language server'})

    buf_command(bufnr, 'LspWorkspaceRemove', function()
      vim.lsp.buf.remove_workspace_folder()
    end, {desc = 'Remove folder from workspace'})
  end

  lspconfig[server.name].setup(opts)
end

lsp_diagnostic()

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = 'rounded',
  }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = 'rounded',
  }
)

command('LspWorkspaceAdd', function() 
  vim.lsp.buf.add_workspace_folder()
end, {desc = 'Add folder to workspace'})

command('LspWorkspaceList', function()
  vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, {desc = 'List workspace folders'})

local init_servers = function()
  lsp_install.setup({})

  for _, server in pairs(lsp_install.get_installed_servers()) do
    if server.name == "rust_analyzer" then
      rust_tools_opts.server = {}
      rust_tools_opts.server.capabilities = lsp_capabilities

      rust_tools_opts.server.on_attach = function(client, bufnr)
        lsp_keymaps(bufnr)
        local buf_command = vim.api.nvim_buf_create_user_command

        buf_command(bufnr, 'LspFormat', function()
          vim.lsp.buf.formatting()
        end, {desc = 'Format buffer with language server'})

        buf_command(bufnr, 'LspWorkspaceRemove', function()
          vim.lsp.buf.remove_workspace_folder()
        end, {desc = 'Remove folder from workspace'})
      end

      require("rust-tools").setup(rust_tools_opts)
    else
      util.update_state(server)
      lsp_setup(server, {})
    end
  end
end

-- cmp setup

local cmp = require('cmp')
local lspkind = require('lspkind')

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

local cmp_config = {
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 3},
    {name = 'buffer', keyword_length = 3},
    {name = 'ultisnips', keyword_length = 2},
  },
  window = {
    documentation = vim.tbl_deep_extend(
      'force',
      cmp.config.window.bordered(),
      {
        max_height = 15,
        max_width = 60,
      }
    )
  },
  formatting = {
    fields = {'abbr', 'menu', 'kind'},
    format = lspkind.cmp_format({
      mode = 'text_symbol',
      maxwidth = 50,
    }),
    before = function(entry, item)
      local short_name = {
        nvim_lsp = 'LSP',
        nvim_lua = 'nvim',
        ultisnips = 'snippet',
      }

      local menu_name = short_name[entry.source.name] or entry.source.name

      item.menu = string.format('[%s]', menu_name)
      return item
    end,
  },
  mapping = {
    -- confirm selection
    ['<TAB>'] = cmp.mapping.confirm({select = false}),

    -- navigate items on the list
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select_opts),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select_opts),

    -- scroll up and down in the completion documentation
    ['<C-n>'] = cmp.mapping.scroll_docs(5),
    ['<C-b>'] = cmp.mapping.scroll_docs(-5),

    -- toggle completion
    ['<C-e>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
        fallback()
      else
        cmp.complete()
      end
    end),

  }
}

cmp.setup(cmp_config)

local suggest_state_file = vim.fn.stdpath('data') .. '/lsp-suggest.info.json'
local suggest_state = {ok = false}

local suggest_server = function()
  local path = suggest_state_file
  local ft = vim.bo.filetype

  if vim.bo.buftype == 'prompt' or ft == '' or ft == nil then
    return
  end

  local state = nil

  if vim.fn.filereadable(path) == 0 then
    suggest_state = util.create_state()
    state = suggest_state
  else
    state = suggest_state.ok and suggest_state 
      or vim.json.decode(util.read_file(path))
  end

  if state.filetypes[ft] then
    return
  end

  state.filetypes[ft] = true
  util.write_file(path, vim.json.encode(state))

  vim.cmd('LspInstall')
end

util.create_state = function()
  local path = suggest_state_file
  local defaults = {
    ok = true,
    servers = {},
    filetypes = {
      ['lsp-installer'] = true,
      qf = true
    },
  }

  util.write_file(path, vim.json.encode(defaults))
  return defaults
end

util.update_state = function(server)
  local path = suggest_state_file
  local state = nil

  if vim.fn.filereadable(path) == 0 then
    state = util.create_state()
  else
    state = suggest_state.ok and suggest_state 
      or vim.json.decode(util.read_file(path))
  end

  if state.servers[server.name] then
    return
  end

  state.servers[server.name] = true

  local fts = server:get_supported_filetypes()

  for _, ft in ipairs(fts) do
    state.filetypes[ft] = true
  end

  util.write_file(path, vim.json.encode(state))
end

autocmd('FileType', {
  pattern = '*',
  group = user_cmds,
  desc = 'Suggest language server',
  callback = function()
    vim.defer_fn(suggest_server, 5)
  end
})


---
-- Utility functions
---

local uv = vim.loop

util.check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

util.write_file = function(path, contents)
  local fd = assert(uv.fs_open(path, 'w', 438))
  uv.fs_write(fd, contents, -1)
  assert(uv.fs_close(fd))
end

util.read_file = function(path)
  local fd = assert(uv.fs_open(path, 'r', 438))
  local fstat = assert(uv.fs_fstat(fd))
  local contents = assert(uv.fs_read(fd, fstat.size, 0))
  assert(uv.fs_close(fd))
  return contents
end


init_servers()


EOF
