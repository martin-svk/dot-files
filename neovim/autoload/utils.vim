" Informative echo line
function! g:utils#showToggles() abort
  echom '<F1> NERDTree | <F2> Free | <F3> Free | <F4> Spellcheck | <F5> Reload rc | <F6> Search HL |' .
        \' <F7> Whitechars | <F8> Built-in terminal | <F9> Free | <F10> Free  | <F11> Free |' .
        \' <F12> This message'
endfunction

" Copy and paste function using xclip
function! g:utils#clipboardYank() abort
  call system('xclip -i -selection clipboard', @@)
endfunction

function! g:utils#clipboardPaste() abort
  let @@ = system('xclip -o -selection clipboard')
endfunction

" Profile neovim and save results to profile.log
function! g:utils#profile() abort
  execute 'profile start profile.log'
  execute 'profile func *'
  execute 'profile file *'
  echom 'Profiling started (will last until you quit neovim).'
endfunction

" When cycling ignore NERDTree and Tagbar
function! g:utils#intelligentCycling() abort
  " Cycle firstly
  wincmd w
  " Handle where you are now
  if &filetype ==# 'nerdtree'
    call g:utils#intelligentCycling()
  endif
  " If in terminal buffer start insert
  if &buftype ==# 'terminal'
    startinsert!
  endif
endfunction

" Be aware of whether you are right or left vertical split
" so you can use arrows more naturally.
" Inspired by https://github.com/ethagnawl.
function! g:utils#intelligentVerticalResize(direction) abort
  let l:window_resize_count = 5
  let l:current_window_is_last_window = (winnr() == winnr('$'))

  if (a:direction ==# 'left')
    let [l:modifier_1, l:modifier_2] = ['+', '-']
  else
    let [l:modifier_1, l:modifier_2] = ['-', '+']
  endif

  let l:modifier = l:current_window_is_last_window ? l:modifier_1 : l:modifier_2
  let l:command = 'vertical resize ' . l:modifier . l:window_resize_count . '<CR>'
  execute l:command
endfunction

" Run NERDTreeFind or Toggle based on current buffer
function! g:utils#nerdWrapper() abort
  if &filetype ==# '' " Empty buffer
    :NERDTreeToggle
  elseif expand('%:t') =~? 'NERD_tree' " In NERD_tree buffer
    wincmd w
  else " Normal file buffer
    :NERDTreeFind
  endif
endfunction

" Strip trailing spaces
function! g:utils#stripTrailingWhitespaces() abort
  " Preparation: save last search, and cursor position.
  let l:lastSearch = @/
  let l:line = line('.')
  let l:col = col('.')

  " Do the business:
  execute '%s/\s\+$//e'

  " Clean up: restore previous search history, and cursor position
  let @/ = l:lastSearch
  call cursor(l:line, l:col)
endfunction

" Set SK keyboard layout with qwerty
function! g:utils#setSKKBLayout() abort
  silent !setxkbmap sk -variant qwerty
endfunction

" Set US keyboard layout with qwerty
function! g:utils#setUSKBLayout() abort
  silent !setxkbmap us
endfunction

" Generate ctags and put them into tags directory
" gem install starscope
function! g:utils#generateCtags() abort
  silent execute '!starscope -x node_modules/ -e ctags'
  echom 'Tags generated into tags file!'
endfunction

" Tab wrapper
function! g:utils#tabComplete() abort
  let l:col = col('.') - 1

  if pumvisible()
    return "\<C-n>"
  else
    if !l:col || getline('.')[l:col - 1] !~# '\k'
      return "\<TAB>"
    else
      return "\<C-n>"
    endif
  endif
endfunction

" Manual Tag complete
function! g:utils#manualTagComplete() abort
  if pumvisible()
    return g:deoplete#mappings#close_popup()
  else
    return g:deoplete#mappings#manual_complete('tag')
  endif
endfunction

" Use omni complete source as default
function! g:utils#useOmniTabWrapper() abort
  inoremap <buffer> <expr> <TAB> utils#insertTabOmniWrapper()
endfunction

" Format function
" Needs: `npm install js-beautify`, `gem install ruby-beautify`, `python`
function! g:utils#formatFile() abort
  let l:line = line('.')
  let l:col = col('.')
  let l:command_prefix = '%!'

  if &filetype ==? 'javascript.jsx'
    let l:command = 'js-beautify -X -f -'
  elseif &filetype ==? 'html'
    let l:command = 'html-beautify -f -'
  elseif &filetype ==? 'css'
    let l:command = 'css-beautify -f -'
  elseif &filetype ==? 'json'
    let l:command = 'python -m json.tool'
  elseif &filetype ==? 'ruby'
    let l:command = 'ruby-beautify -c 2 -s'
  else
    " Basic vim format fallback
    normal! gg=G
  endif

  if exists('l:command')
    execute l:command_prefix . l:command
  endif

  " Return back to where cursor was
  call cursor(l:line, l:col)
endfunction

" NOTE: npm install -g eslint
function! g:utils#eslintFixFile() abort
  let l:line = line('.')
  let l:col = col('.')
  let l:command_prefix = '!'

  if &filetype ==? 'javascript.jsx'
    let l:command = 'eslint --fix %:p'
  endif

  if exists('l:command')
    execute l:command_prefix . l:command
  else
    echom 'Only .js files are supported.'
  endif

  " Return back to where cursor was
  call cursor(l:line, l:col)
endfunction

" Mode function for Lightline statusline
function! g:utils#lightLineMode() abort
  let l:fname = expand('%:t')
  return l:fname =~? 'NERD_tree' ? 'NT' :
        \ winwidth(0) > 70 ? g:lightline#mode() : ''
endfunction

" File format function for Lightline statusline
function! g:utils#lightLineFileformat() abort
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

" Filetype function for Lightline statusline
function! g:utils#lightLineFiletype() abort
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

" File encoding function for Lightline statusline
function! g:utils#lightLineFileencoding() abort
  return winwidth(0) > 70 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

" File name function for Lightline statusline
function! g:utils#lightLineFilename() abort
  let l:fname = expand('%:t')
  return l:fname =~? 'NERD_tree' ? 'NERDTree' :
        \ ('' !=# l:fname ? l:fname : '[No Name]')
endfunction

" Search current word with CtrlSF
" Inspired by github.com/zenbro
function! g:utils#searchCurrentWordWithAg() abort
  execute 'CtrlSF' expand('<cword>')
endfunction

" Reset tabs to 4 spaces
function! g:utils#retabToFourSpaces() abort
  setlocal tabstop=4 shiftwidth=4 expandtab
  retab
endfunction

" Reset tabs to 2 spaces
function! g:utils#retabToTwoSpaces() abort
  setlocal tabstop=2 shiftwidth=2 expandtab
  retab
endfunction

" Nice block heading
" Source: http://vi.stackexchange.com/a/418
function! g:utils#blockHeading(width, word) abort
  let l:char = '='
  let l:inserted_word = ' ' . a:word . ' '
  let l:word_width = strlen(l:inserted_word)
  let l:length_before = (a:width - l:word_width) / 2
  let l:hashes_before = repeat(l:char, l:length_before)
  let l:hashes_after = repeat(l:char, a:width - (l:word_width + l:length_before))
  let l:comment_line = repeat(l:char, a:width)
  let l:word_line = l:hashes_before . l:inserted_word . l:hashes_after

  :put =l:comment_line
  :put =l:word_line
  :put =l:comment_line
endfunction
