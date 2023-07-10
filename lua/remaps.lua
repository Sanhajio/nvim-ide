local m = {}

function m.setup()
  -- Move to the right split
  vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
  -- Move to the left split
  vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
  -- Move to the upper split
  vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
  -- Move to the lower split
  vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })


  vim.api.nvim_set_keymap('n', ']b', ':BufferNext<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '[b', ':BufferPrevious<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
  vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })



end

return m
