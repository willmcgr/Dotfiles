""***************************************
""    File: $dots/cfg/.vimrc
""  Author: willmcgr <williammcgrath8@yahoo.com>
""     vim:ft=vim:
""***************************************
""  TODO: enable digraphs plugin (or replace with local solution)

""***************************************
""  editor options
""***************************************

""  vim options
  ""no vi mode
set nocompatible
  ""no exrc
set noexrc
  ""allow hidden buffers
set nohidden
  ""be selective about window redraws
set nolazyredraw
  ""add subdirs to path
set path+=**
  ""syntax highlighting
syntax enable
set synmaxcol=800
  ""specify terminal
set term=$TERM
  ""command shell
set shell=/usr/bin/zsh
  ""default encodings
scriptencoding utf-8
set fileencoding=utf-8
set encoding=utf-8
  ""default file format
set fileformats=unix,dos,mac
  ""format options
set formatoptions+=qrn1
  ""character deletion
set backspace=indent,eol,start
"fixdel
  ""fix title
set title
set titlestring=%F title
  ""file specific vim options
set modeline
set modelines=10
  ""alert messages
set noerrorbells
set novisualbell
set t_vb=
  ""spliting behaviour
set splitbelow
set splitright
  ""response time
set notimeout
set ttimeout
set ttimeoutlen=10
  ""show statusline
set laststatus=2
set cmdheight=1
set showtabline=2
  ""faster scrolling
set ttyfast
  ""write file on certain actions
set noautowrite
  ""reread file if modified outside vim
set noautoread
  ""leader keys
let mapleader = "\<space>"
let maplocalleader = "\\"
  ""hide mouse while typing
set mousehide


""  interface options
  ""folding options
set nofoldenable
  ""indicate cursor position
set cursorline
set nocursorcolumn
  ""no startup message
set shortmess+=I
  ""line numbers
set number
set norelativenumber
set numberwidth=3
  ""tab characters
set shiftround
  ""indicate matching brackets
set showmatch
set matchtime=3
  ""show ruler
set noruler
  ""256 colours
set t_Co=256
  ""colour scheme
colorscheme nameless
  ""page scrolling
set scrolloff=5
set sidescroll=1
set sidescrolloff=5
  ""line wrapping
set nowrap
set linebreak
set showbreak=↪
  ""indicate whitespace
set nolist
set listchars=tab:»·,trail:·,eol:↵,extends:❯,precedes:❮
  ""indicate current command
set showcmd
  ""indicate current mode
set showmode
  ""spell checking
set nospell
"set dictionary
  ""path/file expansion in command mode
set wildmode=longest:full,list:full,list:longest
set wildchar=<tab>
set wildignore+=.git,.svn,.hg


""  search options
  ""cmd history
set history=1000
  ""begin search while typing
set incsearch
  ""case sensitive search
set ignorecase
set smartcase
  ""indicate results
set hlsearch


""  extra functioning
  ""when swapfile exists
augroup AutoSwap
    autocmd!
    autocmd SwapExists *  call HandleSwapfiles(expand('<afile>:p'))
augroup END


""***************************************
""  backup options
""***************************************

""  backup files
  ""enable backups
set backup
  ""skip backups in...
set backupskip=/tmp/*,/tmp/.*,/var/tmp/*,/var/tmp/.*
  ""save a write backup while writing
set writebackup
  ""location of backup files
set backupdir=/home/will/.vim/tmp/backup//
  ""make backupdir if it don't exist
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif


""  undo action
  ""enable undo files
set undofile
  ""number of undos to keep
set undolevels=1000
set undoreload=10000
  ""location of undo files
set undodir=/home/will/.vim/tmp/undo//
  ""make undodir if it don't exist
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif


""  swap files
  ""enable swapfiles
set swapfile
  ""location of swap files
set directory=/home/will/.vim/tmp/swap//
  ""make swapdir if it don't exist
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif


""***************************************
""  key mappings
""***************************************

""  disable help menu (F1)
  ""unamp all modes
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>
cnoremap <F1> <nop>
  ""remap to toggle line numbers and relative line numbers
"nnoremap <silent> <F1> :setlocal number!<cr>:setlocal relativenumber!<cr>
"inoremap <silent> <F1> <esc>:setlocal number!<cr>:setlocal relativenumber!<cr>a
"vnoremap <silent> <F1> <esc><esc>:setlocal number!<cr>:setlocal relativenumber!<cr>
"cnoremap <silent> <F1> <esc>:setlocal number!<cr>:setlocal relativenumber!<cr>:
  ""remap to toggle line numbers
nnoremap <silent> <F1> :setlocal number!<cr>
inoremap <silent> <F1> <esc>:setlocal number!<cr>a
vnoremap <silent> <F1> <esc><esc>:setlocal number!<cr>
cnoremap <silent> <F1> <esc>:setlocal number!<cr>:


""  open nerdtree
  ""unamp all modes
nnoremap <F2> <nop>
inoremap <F2> <nop>
vnoremap <F2> <nop>
cnoremap <F2> <nop>
  ""all modes
nnoremap <silent> <F2> :NERDTreeToggle<cr>
inoremap <silent> <F2> <esc>:NERDTreeToggle<cr>
vnoremap <silent> <F2> <esc><esc>:NERDTreeToggle<cr>
cnoremap <silent> <F2> <esc>:NERDTreeToggle<cr>:


""  unmap F3
  ""unamp all modes
nnoremap <F3> <nop>
inoremap <F3> <nop>
vnoremap <F3> <nop>
cnoremap <F3> <nop>
  ""remap to toggle spell checking
nnoremap <silent> <F3> :setlocal spell!<cr>
inoremap <silent> <F3> <esc>:setlocal spell!<cr>a
vnoremap <silent> <F3> <esc><esc>:setlocal spell!<cr>
cnoremap <silent> <F3> <esc>:setlocal spell!<cr>:


""  remap arrow keys (beginning)
  ""normal mode (up/down move lines up/down)
"nnoremap <left> <nop>
"nnoremap <silent> <down> ddp
"nnoremap <silent> <up> ddkP
"nnoremap <right> <nop>
  ""normal mode (all become nop)
"nnoremap <left> <nop>
"nnoremap <down> <nop>
"nnoremap <up> <nop>
"nnoremap <right> <nop>
  ""insert mode (all become nop)
"inoremap <left> <nop>
"inoremap <down> <nop>
"inoremap <up> <nop>
"inoremap <right> <nop>
  ""visual mode (all become nop)
"vnoremap <left> <nop>
"vnoremap <down> <nop>
"vnoremap <up> <nop>
"vnoremap <right> <nop>


""  folds
  ""close all but current fold
nnoremap <leader>z zMzvzz
  ""toggle folds
nnoremap <localleader><space> za
vnoremap <localleader><space> za


""  searches
  ""search and substitute
"nnoremap <leader>s :%s///<left><left>
nnoremap <leader>g :%s///cg<left><left><left><left>
nnoremap <localleader>g :%s///g<left><left><left>
  ""center search results
nnoremap n nzzzv
nnoremap N Nzzzv
  ""clear search
"nnoremap <silent> <leader>n :let @/ = ""<cr>
nnoremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
  ""stay on *
nnoremap * *<c-o>


""  misc keybinds
  ""quicker cmd
nnoremap ; :
  ""no ex mode
noremap Q <nop>
  ""add new line, stay in normal mode
nnoremap gO O<esc>j
nnoremap go o<esc>k
  ""toggle list characters
nnoremap <silent> <leader>l :set list!<cr>
  ""select all buffer
"nnoremap Vaa ggVG


""  file ops
  ""save with sudo
cnoremap ws w !sudo tee > /dev/null %
  ""write a file
nnoremap <silent> <leader>w :w<cr>
  ""quit from a file
nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> <leader>Q :q!<cr>
  ""write and quit w/o concern
nnoremap <silent> <leader>x :x!<cr>


""  shortcuts
  ""open a shell
nnoremap <silent> <leader>S :shell<cr>
  ""new tab (empty)
nnoremap <silent> <leader>n :tabe<cr>
  ""new tab (wait for file name)
nnoremap <leader>e :tabe<cr>:e  
  ""find (wait for file name)
nnoremap <leader>f :find 
  ""delete trailing whitespace
nnoremap <silent> <leader>c :%s/\s\+$//<cr>:let @/=''<cr>
  ""select line, ignore leading white space
"nnoremap <silent> vv ^vg_
  ""toggle indent guide
nnoremap <silent> <leader>i :call IndentGuides()<cr>
  ""toggle case
nnoremap <silent> <C-u> g~iwe
inoremap <silent> <C-u> <esc>g~iwea
  ""remap adding number to not the tmux prefix
nnoremap <silent> <C-z> <C-a>
vnoremap <silent> <C-z> <C-a>


""  navigate through files
  ""splits (normal mode) {fixing conflicts with tmux}
"nnoremap <C-h> <C-w><C-h>
"nnoremap <C-j> <C-w><C-j>
"nnoremap <C-k> <C-w><C-k>
"nnoremap <C-l> <C-w><C-l>
  ""splits (insert mode) {fixing conflicts with tmux}
"inoremap <C-h> <esc><C-w><C-h>
"inoremap <C-j> <esc><C-w><C-j>
"inoremap <C-k> <esc><C-w><C-k>
"inoremap <C-l> <esc><C-w><C-l>
  ""tabs
nnoremap <silent> <leader><left> gT
nnoremap <silent> <leader><right> gt


""  source vimrc
  ""whole file
nnoremap <silent> <leader>r :source ${HOME}/.vimrc<cr>
  ""current line
nnoremap <silent> <leader>R ^vg_y:execute @@<cr>
  ""current selection
vnoremap <silent> <leader>S y:execute @@<cr>


""  brackets
  ""open and close
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap < <><esc>i
  ""dont fuck it up
inoremap () ()<esc>i
inoremap [] []<esc>i
inoremap {} {}<esc>i
inoremap <> <><esc>i
  ""use backspace to print only one
inoremap (<bs> (
inoremap [<bs> [
inoremap {<bs> {
inoremap <<bs> <
  ""put an empty line between
inoremap (<cr> (<cr>)<esc>O<tab>
inoremap [<cr> [<cr>]<esc>O<tab>
inoremap {<cr> {<cr>}<esc>O<tab>
inoremap <<cr> <<cr>><esc>O<tab>


""  quotes
  ""open and close
inoremap ' ''<esc>i
inoremap " ""<esc>i
  ""dont fuck it up
inoremap '' ''<esc>i
inoremap "" ""<esc>i
  ""use backspace to print only one
inoremap '<bs> '
inoremap "<bs> "
  ""put an empty line between
inoremap '<cr> '<cr>'<esc>O<tab>
inoremap "<cr> "<cr>"<esc>O<tab>


""  hlnext keybinds
"nnoremap <silent> n n:call HLNext(0.4)<cr>
"nnoremap <silent> N N:call HLNext(0.4)<cr>


""***************************************
""  filetype specific options
""***************************************

""  undo repeated quotes in files
  ""mail buffer
autocmd filetype mail inoremap <buffer> ' '
autocmd filetype mail inoremap <buffer> " "
  ""text files
autocmd filetype txt inoremap <buffer> ' '
autocmd filetype txt inoremap <buffer> " "


""  default options (modeline-like)
  ""python
autocmd filetype python set ai|set et|set ts=4|set sts=4|set sw=4
  ""bash/sh
autocmd filetype sh     set ai|set et|set ts=2|set sts=2|set sw=2|set nu
  ""zsh
autocmd filetype zsh    set ai|set et|set ts=2|set sts=2|set sw=2|set nu
  ""c/cpp/c#
autocmd filetype c      set ai|set et|set ts=4|set sts=4|set sw=4|set nu
autocmd filetype cpp    set ai|set et|set ts=4|set sts=4|set sw=4|set nu
autocmd filetype cs     set ai|set et|set ts=4|set sts=4|set sw=4|set nu
  ""lua
autocmd filetype lua    set ai|set et|set ts=4|set sts=4|set sw=4|set nu
  ""perl
  ""cfgs
autocmd filetype i3     set ai|set et|set ts=2|set sts=2|set sw=2|set nu
autocmd filetype i3bar  set ai|set et|set ts=2|set sts=2|set sw=2|set nu
autocmd filetype vim    set ai|set et|set ts=2|set sts=2|set sw=2|set nu
autocmd filetype tmux   set ai|set et|set ts=2|set sts=2|set sw=2|set nu


""***************************************
""  abbreviations
""***************************************

""  complete identity
  ""email
iabbrev email@ williammcgrath8@yahoo.com
  ""name && email
iabbrev contact@ willmcgr <williammcgrath8@yahoo.com>
  ""name
iabbrev name@ willmcgr


""  common corrections
  ""true
iabbrev true true
  ""false
iabbrev false false
  ""bash
iabbrev bash bash


""  autocompletes
  ""shell logic:  if
autocmd filetype sh
    \  inoreabbrev if@
    \  if <cr>then<cr><cr>fi<esc>ki<tab><esc>
  ""zsh logic:    if
autocmd filetype zsh
    \ inoreabbrev if@
    \ if <cr>then<cr><cr>fi<esc>ki<tab><esc>
  ""shell logic:  function
autocmd filetype sh
    \ inoreabbrev fu@
    \ function ___(){<cr><cr>;}<esc>ki<tab><esc>:call getchar()<cr>
  ""zsh logic:    function
autocmd filetype zsh
    \ inoreabbrev fu@
    \ function ___(){<cr><cr>;}<esc>ki<tab><esc>:call getchar()<cr>


""***************************************
""  local plugins
""***************************************

""  remember cursor position
if has("autocmd")
  ""magic
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \ execute "normal! g`\"" |
        \ endif
endif


""  handle swapfiles
  ""select an option
function! HandleSwapfiles (filename)
  ""if swapfile is older than file delete it
    if getftime(v:swapname) < getftime(a:filename)
        call delete(v:swapname)
        call HSDelayedMsg("Old swapfile detected...and deleted")
        let v:swapchoice = 'e'
  ""if swapfile is newer than file open read only
    else
        call HSDelayedMsg("Swapfile detected...opening read-only")
        let v:swapchoice = 'o'
    endif
endfunction
  ""print a message
function! HSDelayedMsg (msg)
    augroup ASMsg
  ""
        autocmd!
        autocmd BufWinEnter * echohl WarningMsg
        exec 'autocmd BufWinEnter * echon "\r'.printf("%-60s", a:msg).'"'
        autocmd BufWinEnter * echohl NONE
  ""
        autocmd BufWinEnter * augroup ASMsg
        autocmd BufWinEnter * autocmd!
        autocmd BufWinEnter * augroup END
endfunction


""  indent guides
let g:indentguides_state = 0
function! IndentGuides()
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction


""  hlnext
  ""TODO: fix it, its very laggy
function! HLNext (blinktime)
    highlight BlackOnBlack ctermfg=254 ctermbg=254 cterm=none term=none
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let hide_pat = '\%<'.lnum.'l.'
            \ . '\|'
            \ . '\%'.lnum.'l\%<'.col.'v.'
            \ . '\|'
            \ . '\%'.lnum.'l\%>'.(col+matchlen-1).'v.'
            \ . '\|'
            \ . '\%>'.lnum.'l.'
    let hide = matchadd('BlackOnBlack', hide_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime *1000) . 'm'
    call matchdelete(hide)
    redraw
endfunction


""  get file size
  ""NOTE:for statusline
function! FileSize()
  ""get number of bytes
    let bytes = getfsize(expand('%:p'))
  ""calculate kibibytes
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
  ""if kibibytes, calculate mebibytes
    if (exists('kbytes') && kbytes >= 1024)
        let mbytes = kbytes / 1024
    endif
  ""if mebibytes, calculate gibibytes
    if (exists('mbytes') && mbytes >= 1024)
        let gbytes = mbytes / 1024
    endif
  ""if gibibytes, calculate tibibytes
    if (exists('gbytes') && gbytes >= 1024)
        let tbytes = gbytes / 1024
    endif
  ""use unit symbol with number (for clarity)
    if bytes <= 0
        return 'null'
    endif
    if (exists('tbytes'))
        return tbytes . ' Ti'
    elseif (exists('gbytes'))
        return gbytes . ' Gi'
    elseif (exists('mbytes'))
        return mbytes . ' Mi'
    elseif (exists('kbytes'))
        return kbytes . ' Ki'
    else
        return bytes . ' B'
    endif
endfunction


""  fold text (needs work!!!)
  ""TODO: needs some work, variety, etc..
"if has('folding')
"    set foldtext=MyFoldText()
"    function! MyFoldText()
"        if v:version < 701
"            return foldtext()
"        endif
"        set fdm=marker
"        set fillchars=fold:\
"        "let line = ' ' . substitute(getline(v:foldstart), '^\s*##\s*\|^\s*#\s*\|^\s*\|{{{\d*\s*', '', 'g') . ' '
"        "let lines_count = v:foldend - v:foldstart + 1
"        "let lines_count_text = '[ ' . printf("%10s", lines_count . ' lines') . ' ]'
"        "let foldchar = matchstr(&fillchars, 'fold:\zs.')
"        "let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
"        "let foldtextend = lines_count_text . repeat(foldchar, 8)
"        "let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
"        "return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
"        let lines_count = ' ' . printf("%4s", v:foldend - v:foldstart + 1) . ' lines'
"        let line = ': ' . substitute(getline(v:foldstart), '^\s*##--\s*\|^\s*##\s*\|^\s*#\s*\|^\s*\|{{{\d*\s*', '', 'g') . ' '
"        return '+' . repeat('-', v:foldlevel) . lines_count . line
"    endfunction
"endif


""  Mode indicator v1
  ""NOTE: the indicator changes color
  ""TODO: needs some work
let b:mode_name = 'N '
  "" NOTE: get indication, and change User8.. called by statusbar
function! StatusLineModeIndicatorV1()
    setlocal noignorecase
    let b:current_mode = mode()
    if b:current_mode == ''
        let b:mode_name = 'Vb'
    elseif b:current_mode == 'v'
        let b:mode_name = 'V '
    elseif b:current_mode == 'V'
        let b:mode_name = 'Vl'
    endif
    if b:mode_name == 'N '
        highlight User8 ctermfg=11  ctermbg=233 cterm=none term=none
    elseif b:mode_name == 'I '
    elseif b:mode_name == 'R '
    elseif b:mode_name == 'Vb'
        highlight User8 ctermfg=12  ctermbg=4   cterm=none term=none
    elseif b:mode_name == 'Vl'
        highlight User8 ctermfg=9   ctermbg=4   cterm=none term=none
    elseif b:mode_name == 'V '
        highlight User8 ctermfg=11  ctermbg=4   cterm=none term=none
    endif
    setlocal ignorecase
    return b:mode_name
endfunction
  ""NOTE: function to indicate edit modes.. called by Insert* events
function! StatusEditModeIndicatorV1(mode)
    setlocal noignorecase
    let b:test = mode()
    if a:mode == 'i'
        let b:mode_name = 'I '
    elseif a:mode == 'r'
        let b:mode_name = 'R '
    elseif a:mode == '1'
        let b:mode_name = 'N '
    elseif a:mode == '0'
        if b:test == 'i'
            let b:mode_name = 'R '
        elseif b:test == 'R'
            let b:mode_name = 'I '
        endif
    endif
    setlocal ignorecase
endfunction
  ""NOTE: call function when changing modes
"au InsertLeave  * call StatusEditModeIndicatorV1('1')
"au InsertEnter  * call StatusEditModeIndicatorV1(v:insertmode)
"au InsertChange * call StatusEditModeIndicatorV1('0')


""  Mode Indicator (no color change) (seems to work better)
  ""NOTE: no color change, does seem to work better.. idk..
function! StatusLineModeIndicatorV2()
    setlocal noignorecase
    let current_mode = mode()
    if current_mode == 'n'
        return 'N '
    elseif current_mode == 'i'
        return 'I '
    elseif current_mode == 'R'
        return 'R '
    elseif current_mode == ''
        return 'Vb'
    elseif current_mode == 'v'
        return 'V '
    elseif current_mode == 'V'
        return 'Vl'
    endif
    setlocal ignorecase
endfunction


""  Status File Name (TODO)
  ""Note: changes file name colors depending on mode
function! FileNameIndicateMode(mode)
    if a:mode == 'i'
        highlight User3 ctermfg=0   ctermbg=2   cterm=none  term=none
    elseif a:mode == 'R'
        highlight User3 ctermfg=7   ctermbg=1   cterm=none  term=none
    elseif a:mode == 'change'
        if v:insertmode == 'i'
            highlight User3 ctermfg=0   ctermbg=2   cterm=none  term=none
        elseif v:insertmode == 'r'
            highlight User3 ctermfg=7   ctermbg=1   cterm=none  term=none
        endif
    else
        highlight User3 ctermfg=10  ctermbg=233 cterm=none  term=none
    endif
endfunction
  ""Note: apply color changes in insert/replace mode
"autocmd InsertEnter   * call FileNameIndicateMode(v:insertmode)
"autocmd InsertChange  * call FileNameIndicateMode('change')
"autocmd InsertLeave   * call FileNameIndicateMode('leave')


""  statusline
  ""Note: empty
let &stl=''

  ""Note: mode indicator testing
"let &stl.='%8* %{mode()} %*'
  "" separator
"let &stl.='%2* >>%*'
"let &stl.='%2* %*'

  ""Note: mode indicator v1
"let &stl.='%8* %{StatusLineModeIndicatorV1()}%*'
  "" separator
"let &stl.='%2* >>%*'
"let &stl.='%2* %*'

  ""Note: mode indicator v2
"let &stl.='%8* %{StatusLineModeIndicator()}%*'
  "" separator
"let &stl.='%2* >>%*'
"let &stl.='%2* %*'

  ""Note: number of buffers
let &stl.='%1* %n%*'
  "" separator
let &stl.='%2* >>%*'
"let &stl.='%2* %*'

  ""Note: file name (full path)
let &stl.='%3* %<%F %*'
  ""Note: modified?
let &stl.='%4*%m%*'
  ""Note: read-only?
let &stl.='%4*%r%*'
  ""Note: is help file?
let &stl.='%4*%h%*'
  ""Note: is preview window?
let &stl.='%4*%w%*'
  "" separator
let &stl.='%2* >>%*'
"let &stl.='%2* %*'

  ""Note: move to right align
let &stl.='%6* %= %*'
  ""separator
let &stl.='%2* <<%*'
"let &stl.='%2* %*'

  ""Note: show file size
let &stl.='%5* %{FileSize()}%*'
  ""separator
let &stl.='%2* <<%*'
"let &stl.='%2* %*'

  ""Note: get filetype
let &stl.='%6* %{&ft!=""?&ft:"?"}%*'
let &stl.='%7**%*'

  ""Note: get encoding type
let &stl.='%6*%{&fenc!=""?&fenc:&enc."?"}%*'
let &stl.='%7**%*'

  ""Note: get file format
let &stl.='%6*%{&ff!=""?&ff:"?"}%*'
  ""separator
let &stl.='%2* <<%*'
"let &stl.='%2* %*'

  ""Note: current line number
let &stl.='%5* %l%*'
let &stl.='%1*/%*'
let &stl.='%5*%L%*'
let &stl.='%6*,%*'
  ""Note: current column number
let &stl.='%5* %c%*'
  ""separator
let &stl.='%2* <<%*'
"let &stl.='%2* %*'

  ""Note: percent of file
let &stl.='%5* %p%% %*'
let &stl.=''


