local m = {}
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'


function m.setup()
  -- Define the luafmt external formatter configuration
  configs.luafmt = {
    default_config = {
      cmd = { 'luafmt', '--stdin' },
      stdin = true,
      args = {},
      filetypes = { 'lua' },
      -- Adjust to your liking
      root_dir = lspconfig.util.root_pattern('.git', vim.fn.getcwd())
    },
  }

  -- Register the luafmt server
  lspconfig.luafmt.setup {}

  -- Use the 'Format' command provided by nvim-lspconfig
  vim.api.nvim_command('autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)')

  configs.csharpier = {
    default_config = {
      cmd = { 'dotnet tool run csharpier', '--stdin' },
      stdin = true,
      args = {},
      filetypes = { 'cs' },
      -- Adjust to your liking
      root_dir = lspconfig.util.root_pattern('.git', vim.fn.getcwd())
    },
  }

  -- Register the luafmt server
  -- lspconfig.csharpier.setup {}

  -- Use the 'Format' command provided by nvim-lspconfig
  -- vim.api.nvim_command('autocmd BufWritePre *.cs lua vim.lsp.buf.formatting_sync(nil, 100)')


end

return m
