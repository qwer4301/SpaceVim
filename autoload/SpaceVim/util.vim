function! SpaceVim#util#globpath(path, expr) abort
  if has('patch-7.4.279')
    return globpath(a:path, a:expr, 1, 1)
  else
    return split(globpath(a:path, a:expr), '\n')
  endif
endfunction

function! SpaceVim#util#echoWarn(msg) abort
  echohl WarningMsg
  echo a:msg
  echohl None
endfunction

function! SpaceVim#util#haspyxlib(lib) abort

  try
    if has('nvim')
      exe 'py import ' . a:lib
    else
      exe 'pyx import ' . a:lib
    endif
  catch
    return 0
  endtry
  return 1
endfunction

" vim:set et sw=2 cc=80:
