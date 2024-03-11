return {
  'fholgado/minibufexpl.vim',
  version = '*',
  config = function()
    vim.cmd [[
       augroup minibufexpl
         autocmd!
         autocmd VimEnter * MBEOpen
       augroup END
     ]]

    vim.g.miniBufExplMapWindowNavVim = 1
  end,
}
