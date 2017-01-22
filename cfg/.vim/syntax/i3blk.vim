""
""    File: /home/$USER/.vim/colors/i3blk.vim
""  Author: willmcgr
""     vim:nu:ai:et:ts=4:sts=4:sw=4:ft=vim:
""
""  NOTE: my first vimscript

""  other syntax
if exists("b:current_syntax")
    finish
endif

""  Operators
syn match i3BlkOperator "=" nextgroup=i3BlkParamKey,i3BlkParamNum
syn match i3BlkCmdOpr   "=" nextgroup=i3BlkParamPath

highlight link i3BlkOperator Operator
highlight link i3BlkCmdOpr   Operator

""  Parameters
syn match   i3BlkParamNum "\d\+" contained
syn match   i3BlkParamNum "[+-]\d\+" contained
syn match   i3BlkParamNum "\d\+.\d*" contained
syn match   i3BlkParamNum "[+-]\d\+.\d*" contained
syn match   i3BlkParamPath "\S*" contained
syn keyword i3BlkParamKey
    \ left
    \ center
    \ right
    \ once
    \ pango
    \ none
    \ false
    \ true
    \ contained oneline

highlight link i3BlkParamPath Special
highlight link i3BlkParamNum  Constant
highlight link i3BlkParamKey  Keyword

""  Comments
syn match   i3BlkComment "^\s*#.*$" contains=i3Todo
syn keyword i3BlkTodo contained TODO FIXME XXX NOTE

highlight link i3BlkComment Comment
highlight link i3BlkTodo Todo

""  Keywords
syn keyword i3BlkCommand command nextgroup=i3BlkCmdOpr
syn keyword i3BlkKeyword
    \ full_text
    \ short_text
    \ color
    \ min_width
    \ align
    \ name
    \ instance
    \ urgent
    \ separator
    \ separator_block_width
    \ markup
    \ interval
    \ signal
    \ label
    \ format
    \ background
    \ border
    \ border_top
    \ border_bottom
    \ border_left
    \ border_right
    \ nextgroup=i3BlkOperator
highlight link i3BlkKeyword Define
highlight link i3BlkCommand Define

""  Block Names 
syn match i3BlkGroup "\[\|\]"
highlight link i3BlkGroup    Operator


