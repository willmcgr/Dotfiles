

""  vim:nu:ai:et:ts=4:sts=4:sw=4:

""  operator
syntax match    rtOperator "="
highlight link  rtOperator      Operator

""  keywords
"syntax keyword  rtKeyword encoding_list directory skipwhite
"highlight link  rtKeyword       Keyword

syntax match    rtKeyMatch "^\S\+*\s"   skipwhite
highlight link  rtKeyMatch      Keyword


""  highlight the things

