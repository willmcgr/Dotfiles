""***************************************
""    File: $dots/cfg/.vim/colors/nameless.vim
""  Author: willmcgr
""     vim:ft=vim:nu:rnu:ai:et:ts=4:sts=4:sw=4:
""***************************************
""  NOTE: see `:help syntax` for more info
""  NOTE: this is a cli only colorscheme, meaning i will not customize colors for gui

""  requires at least version 700
if version < 700
    finish
endif

""  setup basics
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:color_name="nameless"

""  Colours
  ""  NOTE: see `:help hl-<name>` to get more info
highlight Normal                  ctermfg=7     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight NonText                 ctermfg=16    ctermbg=none  cterm=bold      term=bold       guifg=NONE guibg=NONE gui=none
highlight Title                   ctermfg=3     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Directory               ctermfg=6     ctermbg=none  cterm=none      term=bold       guifg=NONE guibg=NONE gui=none

  ""  NOTE: search results
highlight Search                  ctermfg=235   ctermbg=1     cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight IncSearch               ctermfg=235   ctermbg=3     cterm=none      term=none       guifg=NONE guibg=NONE gui=none

  ""  NOTE: other characters
highlight Ignore                  ctermfg=8     ctermfg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Conceal                 ctermfg=7     ctermbg=242   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight EndOfBuffer             ctermfg=16    ctermbg=none  cterm=none      term=bold       guifg=NONE guibg=NONE gui=none
highlight SpecialKey              ctermfg=11    ctermbg=235   cterm=none      term=none       guifg=NONE guibg=NONE gui=none

  ""  NOTE: thingys for config/program files
highlight Comment                 ctermfg=239   ctermbg=none  cterm=bold      term=bold       guifg=NONE guibg=NONE gui=none
highlight Float                   ctermfg=3     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Include                 ctermfg=5     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Define                  ctermfg=2     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Macro                   ctermfg=13    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight PreProc                 ctermfg=10    ctermbg=none  cterm=none      term=underline  guifg=NONE guibg=NONE gui=none
highlight PreCondit               ctermfg=13    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Type                    ctermfg=6     ctermbg=none  cterm=none      term=underline  guifg=NONE guibg=NONE gui=none
highlight String                  ctermfg=14    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Constant                ctermfg=13    ctermbg=none  cterm=none      term=underline  guifg=NONE guibg=NONE gui=none
highlight Special                 ctermfg=10    ctermbg=none  cterm=none      term=bold       guifg=NONE guibg=NONE gui=none
highlight SpecialChar             ctermfg=9     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Number                  ctermfg=11    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Identifier              ctermfg=13    ctermbg=none  cterm=bold      term=underline  guifg=NONE guibg=NONE gui=none
highlight Conditional             ctermfg=6     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Repeat                  ctermfg=9     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Statement               ctermfg=12    ctermbg=none  cterm=none      term=bold       guifg=NONE guibg=NONE gui=none
highlight Label                   ctermfg=13    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Operator                ctermfg=3     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Keyword                 ctermfg=9     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight StorageClass            ctermfg=11    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Structure               ctermfg=5     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Typedef                 ctermfg=6     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Function                ctermfg=11    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Execption               ctermfg=1     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Underlined              ctermfg=4     ctermbg=none  cterm=underline term=underline  guifg=NONE guibg=NONE gui=none
highlight Tag                     ctermfg=11    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Delimiter               ctermfg=12    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight SpecialComment          ctermfg=9     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Boolean                 ctermfg=3     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Debug                   ctermfg=1     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight MatchParen              ctermfg=8     ctermbg=7     cterm=none      term=reverse    guifg=NONE guibg=NONE gui=none

  ""  NOTE: color line number column
highlight LineNr                  ctermfg=1     ctermbg=233   cterm=none      term=underline  guifg=NONE guibg=NONE gui=none
highlight CursorLineNr            ctermfg=9     ctermbg=233   cterm=bold      term=none       guifg=NONE guibg=NONE gui=none

  ""  NOTE: popup menus
highlight WildMenu                ctermfg=5     ctermbg=15    cterm=none      term=standout   guifg=NONE guibg=NONE gui=none
highlight Pmenu                   ctermfg=2     ctermbg=235   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight PmenuSel                ctermfg=1     ctermbg=235   cterm=bold      term=bold       guifg=NONE guibg=NONE gui=none
highlight PmenuSbar               ctermfg=235   ctermbg=235   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight PmenuThumb              ctermfg=235   ctermbg=235   cterm=none      term=none       guifg=NONE guibg=NONE gui=none

  ""  Note: vim messages
highlight WarningMsg              ctermfg=1     ctermbg=235   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Question                ctermfg=10    ctermbg=15    cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight ErrorMsg                ctermfg=1     ctermbg=235   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight ModeMsg                 ctermfg=13    ctermbg=235   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight MoreMsg                 ctermfg=8     ctermbg=235   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight Todo                    ctermfg=9     ctermbg=none  cterm=bold      term=bold       guifg=NONE guibg=NONE gui=none

  ""  NOTE: folded text (TODO)
highlight Folded                  ctermfg=6     ctermbg=0     cterm=reverse   term=none       guifg=NONE guibg=NONE gui=none
"highlight FoldColumn              ctermfg=14    ctermbg=242   cterm=none      term=standout   guifg=NONE guibg=NONE gui=none
highlight FoldColumn              ctermfg=235   ctermbg=0     cterm=reverse   term=none       guifg=NONE guibg=NONE gui=none

  ""  NOTE: sign colors (TODO)
"highlight SignColumn              ctermfg=      ctermbg=      cterm=          term=
highlight SignColumn              ctermfg=14    ctermbg=242   cterm=none      term=standout   guifg=NONE guibg=NONE gui=none

  ""  NOTE: visual mode selection (red on grey)
highlight Visual                  ctermfg=1     ctermbg=235   cterm=bold      term=reverse    guifg=NONE guibg=NONE gui=none

  ""  NOTE: split bars
highlight VertSplit               ctermfg=9     ctermbg=0     cterm=bold      term=reverse    guifg=NONE guibg=NONE gui=none

  ""  NOTE: cursor colors
highlight Cursor                  ctermfg=6     ctermbg=235   cterm=bold      term=none       guifg=NONE guibg=NONE gui=none
highlight CursorColumn            ctermfg=none  ctermbg=235   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight CursorLine              ctermfg=none  ctermbg=235   cterm=none      term=none       guifg=NONE guibg=NONE gui=none

  ""  NOTE: Diff lines
highlight DiffLine                ctermfg=none  ctermbg=4     cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight DiffText                ctermfg=16    ctermbg=9     cterm=bold      term=reverse    guifg=NONE guibg=NONE gui=none
highlight DiffAdd                 ctermfg=7     ctermbg=5     cterm=none      term=bold       guifg=NONE guibg=NONE gui=none
highlight DiffChange              ctermfg=0     ctermbg=4     cterm=none      term=bold       guifg=NONE guibg=NONE gui=none
highlight DiffDelete              ctermfg=0     ctermbg=6     cterm=none      term=bold       guifg=NONE guibg=NONE gui=none

  ""  NOTE: Vim Script
highlight vimCommentTitle         ctermfg=10    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight vimFold                 ctermfg=0     ctermbg=15    cterm=none      term=none       guifg=NONE guibg=NONE gui=none

  ""  NOTE: Help files
highlight helpHyperTextJump       ctermfg=11    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none

  ""  NOTE: JS
highlight javaScriptNumber        ctermfg=11    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none

  ""  NOTE: HTML
highlight htmlTag                 ctermfg=6     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight htmlEndTag              ctermfg=6     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight htmlTagName             ctermfg=11    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none

  ""  NOTE: Perl
highlight perlSharpBang           ctermfg=10    ctermbg=none  cterm=none      term=standout   guifg=NONE guibg=NONE gui=none
highlight perlStatement           ctermfg=13    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight perlStatementStorage    ctermfg=1     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight perlVarPlain            ctermfg=3     ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight perlVarPlain2           ctermfg=11    ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none

  ""  NOTE: Ruby
highlight rubySharpBang           ctermfg=10    ctermbg=none  cterm=none      term=standout   guifg=NONE guibg=NONE gui=none

  ""  NOTE: Spell check
highlight clear SpellBad
highlight clear SpellCap
highlight clear SpellRare
highlight clear SpellLocal
highlight SpellBad                ctermfg=9     ctermbg=235   cterm=bold      term=bold       guifg=NONE guibg=NONE gui=none
highlight SpellCap                ctermfg=3     ctermbg=none  cterm=underline term=none       guifg=NONE guibg=NONE gui=none
highlight SpellRare               ctermfg=13    ctermbg=none  cterm=underline term=none       guifg=NONE guibg=NONE gui=none
highlight SpellLocal              ctermfg=none  ctermbg=none  cterm=none      term=none       guifg=NONE guibg=NONE gui=none

  ""  NOTE: for function indentguides
highlight IndentGuides            ctermfg=none  ctermbg=1     cterm=none      term=none       guifg=NONE guibg=NONE gui=none

  ""  NOTE: statusline
highlight StatusLine              ctermfg=none  ctermbg=233   cterm=none      term=bold       guifg=NONE guibg=NONE gui=none
highlight StatusLineNC            ctermfg=none  ctermbg=233   cterm=bold      term=reverse    guifg=NONE guibg=NONE gui=none

  ""  NOTE: statusline colours
highlight User1                   ctermfg=13    ctermbg=233   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight User2                   ctermfg=4     ctermbg=233   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight User3                   ctermfg=10    ctermbg=233   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight User4                   ctermfg=9     ctermbg=233   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight User5                   ctermfg=11    ctermbg=233   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight User6                   ctermfg=7     ctermbg=233   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight User7                   ctermfg=3     ctermbg=233   cterm=none      term=none       guifg=NONE guibg=NONE gui=none
highlight User8                   ctermfg=11    ctermbg=233   cterm=none      term=none       guifg=NONE guibg=NONE gui=none

  ""  NOTE: tab bar (in-progress) 
highlight TabLineSel              ctermfg=2     ctermbg=254   cterm=bold      term=bold       guifg=NONE guibg=NONE gui=none
highlight TabLine                 ctermfg=8     ctermbg=254   cterm=none      term=underline  guifg=NONE guibg=NONE gui=none
highlight TabLineFill             ctermfg=254   ctermbg=254   cterm=none      term=reverse    guifg=NONE guibg=NONE gui=none

  ""  make the 81st column standout (coding to 80 columns)
highlight ColorColumn             ctermfg=8     ctermbg=1     cterm=none      term=reverse    guifg=NONE guibg=NONE gui=none
call matchadd('ColorColumn', '\%81v', 100)


