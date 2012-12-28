func! CurTabFileName( )
  return fnamemodify(bufname(winbufnr(tabpagewinnr(0))), ':t')
endfun
func! TabSort()
  for i in range(tabpagenr('$'), 1, -1)
    :tabr
    for j in range(1,i-1)
      let t1 = CurTabFileName()
      :tabn
      let t2 = CurTabFileName()
      if t2 < t1
        tabp
        exec ":tabmove ".j
      endif
    endfor
  endfor
endfun
command! TabSort :call TabSort()
