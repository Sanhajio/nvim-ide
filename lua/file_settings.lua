local m = {}

function m.setup()
  -- vim.opt.foldmethod = 'indent'
  -- Move to the right split
  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
  vim.o.tabstop = 2
  vim.o.shiftwidth = 2
  vim.o.softtabstop = 2
end

return m
