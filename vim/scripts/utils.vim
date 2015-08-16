" Informative echo line
function! utils#showToggles()
  echom "<F1> NERDTree | <F2> Free | <F3> Paste mode | <F4> Spellcheck | <F5> Reload rc | <F6> Highlighting |" .
        \" <F7> Whitechars | <F8> Syntastic | <F9> Free | <F10> Test file | <F11> Test current | <F12> This message"
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

" Run current file
function! utils#runCurrentFile()
  if &filetype ==? 'ruby'
    let command = 'ruby %'
  elseif &filetype ==? 'sh'
    let command = 'sh %'
  else
    echom "Can't run current file (unsupported filetype: " . &filetype . ")"
  endif

  if exists('command')
    execute ':T ' . command
  endif
endfunction

" Run NERDTreeFind or Toggle based on current buffer
function! utils#nerdWrapper()
  if &filetype ==# ''
    :NERDTreeToggle
  else
    :NERDTreeFind
  endif
endfunction

" Run built-in terminal in vertical split
function! utils#newVertTerm()
  wincmd v
  vertical resize 80
  :terminal
endfunction

" Run built-in terminal in horizontal split
function! utils#newTerm()
  wincmd s
  resize 15
  :terminal
endfunction

" Strip trailing spaces
function! utils#stripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Set SK keyboard layout with qwerty
function! utils#setSKKBLayout()
  silent !setxkbmap sk -variant qwerty
endfunction

" Set US keyboard layout with qwerty
function! utils#setUSKBLayout()
  silent !setxkbmap us
endfunction

" Generate ctags and put them into .tags directory
function! utils#generateCtags()
  silent execute '!mkdir .tags > /dev/null 2>&1'
  silent execute '!ctags --tag-relative --extra=+f -Rf .tags/tags --exclude=.git --languages=-sql'
  echom "Tags generated into .tags/tags file!"
endfunction

" Generate ctags with also gems and put them into .tags directory
function! utils#generateRubyCtags()
  silent execute '!mkdir .tags > /dev/null 2>&1'
  silent execute '!ctags --tag-relative --extra=+f -Rf .tags/tags --exclude=.git --languages=-sql . $(bundle list --paths)'
  echom "Tags generated into .tags/tags file!"
endfunction

" Rename current file (from @grb - https://github.com/garybernhardt)
function! utils#renameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    execute ':saveas ' . new_name
    execute ':silent !rm ' . old_name
    redraw!
  endif
endfunction

" Tab wrapper
function! utils#insertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

function! utils#insertTabOmniWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction

" Simple notes management
function! utils#createNote(name)
  execute ':e ~/notes/' . a:name . '.md'
endfunction

function! utils#openNotes()
  execute ':e ~/notes/'
endfunction

" Use omni complete source as default
function! utils#useOmniTabWrapper()
  inoremap <buffer> <expr> <tab> utils#insertTabOmniWrapper()
endfunction

" Unite commands wrappers

function! utils#uniteSources()
  execute 'Unite -start-insert source'
endfunction

function! utils#uniteFileRec()
  execute 'Unite -no-split -buffer-name=project-files -start-insert file_rec/async:!'
endfunction

function! utils#uniteBuffers()
  execute 'Unite -no-split -buffer-name=buffers -start-insert buffer'
endfunction

function! utils#uniteTags()
  execute 'Unite -no-split -buffer-name=tags -start-insert outline'
endfunction

function! utils#uniteGrep()
  execute 'Unite -silent grep:.'
endfunction

function! utils#uniteHistory()
  execute 'Unite -buffer-name=edit-history change'
endfunction

function! utils#uniteLineSearch()
  execute 'Unite -no-split -buffer-name=line-search -start-insert line'
endfunction

function! utils#uniteYankHistory()
  execute 'Unite -buffer-name=yank-history history/yank'
endfunction

function! utils#uniteRegisters()
  execute 'Unite -buffer-name=registers register'
endfunction

function! utils#uniteWindows()
  execute 'Unite -no-split -buffer-name=splits window'
endfunction

function! utils#uniteSnippets()
  execute 'Unite -no-split -buffer-name=snippets -start-insert ultisnips'
endfunction

function! utils#uniteCustomMenu()
  execute 'Unite menu'
endfunction
