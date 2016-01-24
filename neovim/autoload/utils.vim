" Informative echo line
function! g:utils#showToggles() abort
  echom '<F1> NERDTree | <F2> Free | <F3> Paste mode | <F4> Spellcheck | <F5> Reload rc | <F6> Search HL |' .
        \' <F7> Whitechars | <F8> Vertical Term | <F9> Fire REST Request | <F10> Free  | <F11> How do I |' .
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

" Run current file
function! g:utils#runCurrentFile() abort
  if &filetype ==? 'ruby'
    let l:command = 'ruby %'
  elseif &filetype ==? 'sh'
    let l:command = 'sh %'
  else
    echom "Can't run current file (unsupported filetype: " . &filetype . ')'
  endif

  if exists('command')
    execute ':terminal ' . l:command
  endif
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
  %s/\s\+$//e

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

" Generate ctags and put them into .tags directory
function! g:utils#generateCtags() abort
  silent execute '!ctags  --extra=+f -Rf .tags --exclude=.git --languages=-sql'
  echom 'Tags generated into .tags file!'
endfunction

" Generate ctags for JS projects (ignoring .meteor, node_modules, bower_components)
function! g:utils#generateJSCtags() abort
  silent execute '!ctags  --extra=+f -Rf .tags'
        \ '--exclude=.git --exclude=node_modules --exclude=bower_components --exclude=.meteor --languages=-sql'
  echom 'Tags generated into .tags file!'
endfunction

" Tab wrapper
function! g:utils#tabComplete() abort
  let l:col = col('.') - 1
  if !l:col || getline('.')[l:col - 1] !~# '\k'
    return "\<TAB>"
  else
    if pumvisible()
      return "\<C-n>"
    else
      return g:deoplete#mappings#manual_complete('buffer')
    endif
  endif
endfunction

" Simple notes management
function! g:utils#openNotes() abort
  execute ':e ~/dev/notes/vim-notes.md'
endfunction

" Use omni complete source as default
function! g:utils#useOmniTabWrapper() abort
  inoremap <buffer> <expr> <TAB> utils#insertTabOmniWrapper()
endfunction

" Unite commands wrappers
function! g:utils#uniteSources() abort
  execute 'Unite -no-split -buffer-name=sources -start-insert source'
endfunction

function! g:utils#uniteMRUs() abort
  execute 'Unite -no-split -buffer-name=most-recently-used -start-insert neomru/file'
endfunction

function! g:utils#uniteFileBrowse() abort
  execute 'Unite -no-split -buffer-name=project-files -start-insert file'
endfunction

function! g:utils#uniteFileRec() abort
  execute 'Unite -no-split -buffer-name=file-recursive-search -start-insert file_rec/neovim'
endfunction

function! g:utils#uniteBuffers() abort
  execute 'Unite -no-split -buffer-name=buffers -start-insert buffer'
endfunction

function! g:utils#uniteOutline() abort
  execute 'Unite -no-split -buffer-name=symbols -start-insert outline'
endfunction

function! g:utils#uniteTags() abort
  execute 'Unite -no-split -buffer-name=tags -start-insert tag'
endfunction

function! g:utils#uniteHistory() abort
  execute 'Unite -no-split -buffer-name=edit-history change'
endfunction

function! g:utils#uniteLineSearch() abort
  execute 'Unite -no-split -buffer-name=line-search -start-insert line'
endfunction

function! g:utils#uniteYankHistory() abort
  execute 'Unite -no-split -buffer-name=yank-history history/yank'
endfunction

function! g:utils#uniteRegisters() abort
  execute 'Unite -no-split -buffer-name=registers register'
endfunction

function! g:utils#uniteWindows() abort
  execute 'Unite -no-split -buffer-name=splits window'
endfunction

function! g:utils#uniteSnippets() abort
  execute 'Unite -no-split -buffer-name=snippets -start-insert ultisnips'
endfunction

function! g:utils#uniteCustomMenu() abort
  execute 'Unite -no-split -buffer-name=menu -start-insert menu'
endfunction

function! g:utils#uniteJumps() abort
  execute 'Unite -no-split -buffer-name=jumps -start-insert jump'
endfunction

function! g:utils#uniteCommands() abort
  execute 'Unite -no-split -buffer-name=commands -start-insert command'
endfunction

function! g:utils#uniteMappings() abort
  execute 'Unite -no-split -buffer-name=mappings -start-insert mapping'
endfunction

" Format function
" Needs: npm install js-beautify, gem install rbeautify, python
function! g:utils#formatFile() abort
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
    let l:command = 'rbeautify -s -c 2'
  else
    " Basic vim format fallback
    normal mzgg=G`z
  endif

  if exists('l:command')
    execute l:command_prefix . l:command
  endif
endfunction

" Annotate file function (only ruby support for now)
function! g:utils#annotateFile() abort
  let l:command_prefix = '%!'

  if &filetype ==? 'ruby'
    let l:command = 'seeing_is_believing -x'
  endif

  if exists('l:command')
    execute l:command_prefix . l:command
  endif
endfunction

" Mode function for Lightline statusline
function! g:utils#lightLineMode() abort
  let l:fname = expand('%:t')
  return l:fname =~? 'NERD_tree' ? 'NT' :
        \ &filetype ==? 'unite' ? 'Unite' :
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
        \ &filetype ==? 'unite' ? g:unite#get_status_string() :
        \ ('' !=# l:fname ? l:fname : '[No Name]')
endfunction

" Howdoi integration (pip install howdoi)
function! g:utils#howDoI() abort
  let l:command_prefix = 'read '
  let l:howdoi = '!howdoi '

  call inputsave()
  let l:query = input('How do I: ')
  call inputrestore()

  if l:query !=# ''
    execute l:command_prefix . l:howdoi . l:query
  endif
endfunction

" Search current word with CtrlSF
" Inspired by github.com/zenbro
function! g:utils#searchCurrentWordWithAg() abort
  execute 'CtrlSF' expand('<cword>')
endfunction
