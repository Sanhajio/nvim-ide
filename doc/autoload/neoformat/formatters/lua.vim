function! neoformat#formatters#lua#luafmt() abort
  return {
    \ 'exe': 'luafmt',
    \ 'args': ['-i', '2', '-w', 'none', '-c'],
    \ 'stdin': 1,
    \ }
endfunction

function! neoformat#formatters#lua#enabled() abort
    return ['luafmt']
endfunction

let g:neoformat_try_node_exe = 1

function! neoformat#formatters#lua#enabled() abort
    return ['prettier']
endfunction

