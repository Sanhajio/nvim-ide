return {
  'epwalsh/obsidian.nvim',
  version = '*',
  ft = 'markdown',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'neosky',
        path = '~/neosky',
      },
    },
  },
}
