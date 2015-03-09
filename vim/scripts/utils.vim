" Informative echo line
function! utils#showToggles()
  echom "<F1> NERDTree | <F2> NERDTreeFind | <F3> Paste mode | <F4> Spellcheck | <F5> Reload rc | <F6> Search Highlight |" .
        \" <F7> Whitechars | <F8> <free> | <F9> <free> | <F10> Tagbar | <F11> Syntastic | <F12> This message"
endfunction

" Copy and paste function using xclip
function! utils#clipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction

function! utils#clipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

" When cycling ignore NERDTree and Tagbar
function! utils#intelligentCycling()
  " Cycle firstly
  wincmd w
  " Handle where you are now
  if &buftype ==# 'nofile'
    call utils#intelligentCycling()
  endif
endfunction

function! utils#runCurrentFile()
  !ruby %
endfunction
