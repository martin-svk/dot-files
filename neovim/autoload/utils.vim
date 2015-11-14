" Informative echo line
function! utils#showToggles()
  echom "<F1> NERDTree | <F2> Neomake | <F3> Paste mode | <F4> Spellcheck | <F5> Reload rc | <F6> Highlighting |" .
        \" <F7> Whitechars | <F8> Free | <F9> Free | <F10> Free | <F11> Free | <F12> This message"
endfunction

" Copy and paste function using xclip
function! utils#clipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction

function! utils#clipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

" Profile neovim and save results to profile.log
function! utils#profile()
  execute 'profile start profile.log'
  execute 'profile func *'
  execute 'profile file *'
  echom "Profiling started (will last until you quit neovim)."
endfunction

" When cycling ignore NERDTree and Tagbar
function! utils#intelligentCycling()
  " Cycle firstly
  wincmd w
  " Handle where you are now
  if &buftype ==# 'nofile'
    call utils#intelligentCycling()
  endif
  " If in terminal buffer start insert
  if &buftype == 'terminal'
    startinsert!
  endif
endfunction

" Be aware of whether you are right or left vertical split
" so you can use arrows more naturally.
" Inspired by https://github.com/ethagnawl.
function! utils#intelligentVerticalResize(direction)
  let window_resize_count = 5
  let current_window_is_last_window = (winnr() == winnr("$"))

  if (a:direction == 'left')
    let [modifier_1, modifier_2] = ['+', '-']
  else
    let [modifier_1, modifier_2] = ['-', '+']
  endif

  let modifier = current_window_is_last_window ? modifier_1 : modifier_2
  let command = 'vertical resize ' . modifier . window_resize_count . '<CR>'
  execute command
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
    execute ':terminal ' . command
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
  vertical resize 60
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
  silent execute '!ctags  --extra=+f -Rf .tags --exclude=.git --languages=-sql'
  echom "Tags generated into .tags file!"
endfunction

" Generate ctags for JS projects (ignoring .meteor, node_modules, bower_components)
function! utils#generateJSCtags()
  silent execute '!ctags  --extra=+f -Rf .tags'
        \ '--exclude=.git --exclude=node_modules --exclude=bower_components --exclude=.meteor --languages=-sql'
  echom "Tags generated into .tags file!"
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
function! utils#openNotes()
  execute ':e ~/dev/notes/vim-notes.md'
endfunction

" Use omni complete source as default
function! utils#useOmniTabWrapper()
  inoremap <buffer> <expr> <tab> utils#insertTabOmniWrapper()
endfunction

" Unite commands wrappers
function! utils#uniteSources()
  execute 'Unite -no-split -buffer-name=sources -start-insert source'
endfunction

function! utils#uniteMRUs()
  execute 'Unite -no-split -buffer-name=most-recently-used -start-insert neomru/file'
endfunction

function! utils#uniteFileBrowse()
  execute 'Unite -no-split -buffer-name=project-files -start-insert file'
endfunction

function! utils#uniteFileRec()
  execute 'Unite -no-split -buffer-name=file-recursive-search -start-insert file_rec/async:!'
endfunction

function! utils#uniteBuffers()
  execute 'Unite -no-split -buffer-name=buffers -start-insert buffer'
endfunction

function! utils#uniteOutline()
  execute 'Unite -no-split -buffer-name=symbols -start-insert outline'
endfunction

function! utils#uniteTags()
  execute 'Unite -no-split -buffer-name=tags -start-insert tag'
endfunction

function! utils#uniteGrep()
  execute 'Unite -no-split -buffer-name=ag -silent grep:.'
endfunction

function! utils#uniteHistory()
  execute 'Unite -no-split -buffer-name=edit-history change'
endfunction

function! utils#uniteLineSearch()
  execute 'Unite -no-split -buffer-name=line-search -start-insert line'
endfunction

function! utils#uniteYankHistory()
  execute 'Unite -no-split -buffer-name=yank-history history/yank'
endfunction

function! utils#uniteRegisters()
  execute 'Unite -no-split -buffer-name=registers register'
endfunction

function! utils#uniteWindows()
  execute 'Unite -no-split -buffer-name=splits window'
endfunction

function! utils#uniteSnippets()
  execute 'Unite -no-split -buffer-name=snippets -start-insert ultisnips'
endfunction

function! utils#uniteCustomMenu()
  execute 'Unite -no-split -buffer-name=menu -start-insert menu'
endfunction

function! utils#uniteJumps()
  execute 'Unite -no-split -buffer-name=jumps -start-insert jump'
endfunction

" Format function
" Needs: npm install js-beautify, gem install rbeautify, python
function! utils#formatFile()
  let command_prefix = '%!'

  if &filetype ==? 'javascript.jsx'
    let command = 'js-beautify -X -f -'
  elseif &filetype ==? 'html'
    let command = 'html-beautify -f -'
  elseif &filetype ==? 'css'
    let command = 'css-beautify -f -'
  elseif &filetype ==? 'json'
    let command = 'python -m json.tool'
  elseif &filetype ==? 'ruby'
    let command = 'rbeautify -s -c 2'
  else
    " Basic vim format fallback
    normal mzgg=G`z
  endif

  if exists('command')
    execute command_prefix . command
  endif
endfunction

" Annotate file function (only ruby support for now)
function! utils#annotateFile()
  let command_prefix = '%!'

  if &filetype ==? 'ruby'
    let command = 'seeing_is_believing -x'
  endif

  if exists('command')
    execute command_prefix . command
  endif
endfunction
