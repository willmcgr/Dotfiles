##***************************************
##**    file: $dots/cfg/.zsh/.zshrc
##**  author: willmcgr
##**     vim:ft=zsh:fdm=marker:
##***************************************
##  

##***************************************
##**  general settings
##***************************************

##**  check interactive
[[ $- != *i* ]] && return

##**  mutha fukin flow control
  ##  its time to stop
command stty ixoff
command stty -ixon
  ##  set keys to nada
command stty start ''
command stty stop ''
  ##  shit hits the fan
command stty ixany

##**  key modes
  ##  vi keys
bindkey -v
  ##  emacs keys
#bindkey -e
  ##  timeout for vi mode change
KEYTIMEOUT=1

##**  keep track of logins and long running commands
  ##  report commands that last longer than a minute
REPORTTIME=60
  ##  watch for users who are not me
WATCH=notme
  ##  reporting format
WATCHFMT=$' \e[1;34m%n\e[0m has %a \e[0;36m%l\e[0m from \e[1;32m%m\e[0m at \e[0;33m%T\e[0m on \e[1;33m%D\e[0m. '

##**  history options
  ##  history files
RUNHISTFILE="${ZDOTDIR:-${HOME}}/.runhist"
HISTFILE="${ZDOTDIR:-${HOME}}/.zshhist"
HISTFILESIZE=65536
  ##  history size
HISTSIZE=10000
SAVEHIST=$((HISTSIZE/2))

##**  directory stack
  ##  dirs to remember
DIRSTACKSIZE=20
  ##  location of dir file
#DIRSTACKFILE="/tmp/.zsh_zdirs"
DIRSTACKFILE="${ZDOTDIR:-${HOME}}/.zdirs"

##**  completion dump
  ##  dump file
#COMPDUMPFILE="/tmp/.zsh_zcompdump"
COMPDUMPFILE="${ZDOTDIR:-${HOME}}/.zcompdump"

##**  persistent history
  ##  put frequent commands in here for conveinence
if [[ -r ${ZDOTDIR:-${HOME}}/.important_commands ]];then
    fc -R ${ZDOTDIR:-${HOME}}/.important_commands
fi

##**  load host specific rc
  ##  load local settings if they there
if [[ -r ${HOME}/.zshrc.local ]];then
    builtin source ${HOME}/.zshrc.local
fi

##**  grep options
  ##  default grep colors
export GREP_COLOR="1;31"
GREP_COLORS="38;5;230"
  ##  color whole selected line matches
GREP_COLORS+=":sl=38;5;240"
  ##  color whole context line matches
GREP_COLORS+=":cx=38;5;100"
  ##  color non-matching text in a matching line
GREP_COLORS+=":mt=38;5;161;1"
  ##  color non-matching text in a context line
GREP_COLORS+=":ms=38;5;161;1"
  ##  for file names prefixing content lines
GREP_COLORS+=":fn=38;5;197"
  ##  for line numbers prefixing content lines
GREP_COLORS+=":ln=38;5;212"
  ##  for byte offsets prefixing content line
GREP_COLORS+=":bn=38;5;44"
  ##  for context separators
GREP_COLORS+=":se=38;5;166"
  ##  export colors
export GREP_COLORS="${GREP_COLORS}"
  ##  make options array
typeset -ga grep_options
if [[ "$(command uname -s)" == "Linux" ]]; then
    grep_options+=( --color=always )
fi
  ##  add any local options to grep_options
#function grep_opts(){
#    local -a opts
#    local proj_opts="${PWD}/.grepoptions"
#    opts=( ${(f)"$(< "${HOME}/.grepoptions")"} )
#    if [[ -r ${proj_opts} ]] && [[ $PWD != $HOME ]];then
#        opts+=( ${${(f)"$(< "${proj_opts}")"}:#[#]*} )
#    fi
#    grep_options+=( ${(j: :)opts} )
#}

##**  gcc options
  ##  default gcc colors, names are self-explainatory
GCC_COLORS="error=01;31"
GCC_COLORS+=":warning=01;35"
GCC_COLORS+=":note=01;36"
GCC_COLORS+=":caret=01;32"
  ##  location info
GCC_COLORS+=":locus=01"
GCC_COLORS+=":quote=01"
  ##  export colors
export GCC_COLORS="${GCC_COLORS}"

##**  ls options
  ##  for colors; load dircolors config if its readable
if [[ -r ${HOME}/.dircolors ]]; then
    eval $(command dircolors -b ${HOME}/.dircolors)
else
    eval $(command dircolors -b)
fi
  ##  make options array
typeset -ga ls_options
if [[ "$(command uname -s)" == "Linux" ]]; then
    ls_options+=( --color=always --group-directories-first -F )
fi

##**  terminfo
  ##  load terminfo if in home dir
if [[ -r ${HOME}/.terminfo ]]; then
    export TERMINFO=${HOME}/.terminfo
fi

##**  autoload plugins
  ##  colors
autoload -Uz colors && colors
  ##  zmv (a better batched mv)
autoload -U zmv
  ##  cli edit
autoload edit-command-line && zle -N edit-command-line


##***************************************
##**  shell options
##***************************************

##**  globbing options
##***************************************
  ##  *   see man 1 zshoptions for more info
setopt glob
setopt globcomplete
setopt extendedglob
setopt no_globdots
setopt globstarshort
setopt no_kshglob
setopt markdirs
setopt no_numericglobsort
#test with btrfs commands, might fix brace exansion issues
#setopt brace_ccl

##**  history options
##***************************************
  ##  *   see man 1 zshoptions for more info
setopt append_history
setopt extendedhistory
setopt histallowclobber
setopt no_histbeep
setopt histexpiredupsfirst
setopt histignorealldups
setopt histignoredups
setopt histignorespace
setopt histsavenodups
unsetopt histverify
setopt no_histverify
unsetopt incappendhistory
setopt no_incappendhistory
setopt no_incappendhistorytime
setopt sharehistory

##**  dirs stack options
##***************************************
  ##  *   see man 1 zshoptions for more info
setopt autopushd
setopt pushdignoredups
setopt pushdsilent
setopt pushdtohome

##**  job control
##***************************************
  ##  *   see man 1 zshoptions for more info
setopt checkjobs
setopt no_hup
setopt longlistjobs
unsetopt notify
setopt no_notify

##**  other misc options
##***************************************
  ##  *   see man 1 zshoptions for more info
setopt aliases
setopt autocd
setopt no_clobber
setopt correct
setopt no_correctall
setopt no_flowcontrol
setopt no_printexitvalue
setopt rmstarwait
setopt no_shwordsplit
setopt no_match
setopt chaselinks
setopt completealiases
setopt completeinword
unsetopt listbeep
setopt no_listbeep
setopt no_beep
#use to fix completions with dvorak
#setopt dvorak


##***************************************
##**  completions
##***************************************
##**  TODO: read up on these completions and rework this mess

##**  load basic completions
##***************************************
  ##  load plugin
autoload -Uz compinit && compinit

  ##  load modules
zmodload zsh/complist

  ##  location of source file
#zstyle :compinstall filename '${ZDOTDIR:-${HOME}/.zsh}/.zshrc'

  ##  check modules
if (( ${+_comps} == 0 ));then
    print "\e[1;31;40m::  \e[1;36;40mzshrc\e[1;35;40m()\e[1;37;40m:\e[0m\t\e[1;31mERROR\e[1;37m:\tCompletions modules not properly loaded\e[0m"
fi

##**  define extended completions
##***************************************
  ##  completers to use
zstyle ':completion:*::::'                        completer _expand _complete _ignored _approximate
#zstyle ':completion:*'                            expand prefix suffix
#zstyle ':completion:*'                            completer _expand_alias _complete _approximate

  ##  use list colors (LS_COLORS)
zstyle ':completion:*:defaults'                   list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*'                            list-colors ${(s.:.)LS_COLORS}

  ## tell _expand to insert a whitespace
zstyle ':completion:*'                            add-space true

  ##  tell _match and _approximate to insert if unambiguous matching is possible
zstyle ':completion:*'                            insert-unambiguous true

  ##  start menu completion if 2 or more matches exist
zstyle ':completion:*'                            menu yes select=15

  ##  verbose output
zstyle ':completion:*'                            verbose yes

  ##  ignore zsh internal functions
zstyle ':completion:*:functions'                  ignored-patterns '_*'

  ##  aliases tag colors
zstyle ':completion:*:aliases'                    list-colors '=*=0;32'

  ##  function tag colors
zstyle ':completion:*:functions'                  list-colors '=*=0;31'

  ##  group things by tags
zstyle ':completion:*:matches'                    group 'yes'
zstyle ':completion:*'                            group-name ''

  ##  list of usernames to complete
users=( will root )

  ##  complete usernames
zstyle ':completion:*'                            users $users

  ##  processes
zstyle ':completion:*:processes'                  command 'ps -au$USER'

  ##  enable menu for [p]kill[all]
zstyle ':completion:*:*:(pkill|kill|killall):*'   menu yes select
zstyle ':completion:*:(pkill|kill|killall):*'     force-list always

  ##  color output red[pids] and yellow[names] blue[all_else]
zstyle ':completion:*:*:kill:*'                   list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'

  ##  mpv completes dirs, audio, video files
zstyle ':completion:*:*:mpv:*:*'                  file-patterns '*(.mp4|.avi|.mov) *(.mp3|.wav|.flac) *(-/)'

  ##  pkg mgr completions
zstyle ':completion:*:*:pacman:*'                 force-list always
zstyle ':completion:*:*:pacman:*'                 menu yes select

  ##  ignore l&f
zstyle ':completion:*:cd:*'                       ignored-patterns '(*/)#lost+found' '(*/)#CVS'

  ##  ignore used files in line
zstyle ':completion:*:(rm|cp|mv|kill|diff|scp):*' ignore-line yes

  ##  cd ignores parent dirs
zstyle ':completion:*:cd:*'                       ignore-parents parent pwd

  ##  dirs stack
zstyle ':completion:*:*:cd:*:directory-stack'     menu yes select

  ##  sort menu items by name
zstyle ':completion:*'                            file-sort name

  ##  sudo completes whats in $path
zstyle ':completion:*:sudo:*'                     command-path $path

  ##  man pages are better
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select


##**  formatting 
##***************************************
  ##  default formatting
zstyle ':completion:*'                  format '%B%d%b'

  ##  warnings formatting
zstyle ':completion:*:warnings'         format "%B$fg[red]%}no match for: $fg[white]%d%b"

  ##  descriptions formatting
zstyle ':completion:*:descriptions'     format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'

  ##  messages formatting
zstyle ':completion:*:messages'         format '%B%U%d%u%b'

  ##  corrections formatting
zstyle ':completion:*:corrections'      format '%B%d (errors: %e)%b'


##***************************************
##**  keybinding
##***************************************

##**  Ctrl+h: run help
bindkey -M viins "" run-help
bindkey -M vicmd 'h'  run-help

##**  Esc+v:  edit command in vi before executing...
bindkey -M vicmd "v" edit-command-line

##**  Ctrl+r: history search
bindkey -M viins "" history-incremental-search-backward
bindkey -M vicmd "" history-incremental-search-backward

##**  extend normal keys
  ##  Ctrl+e: exit shell
bindkey "" Q
  ##  Ctrl+p: change prompt
bindkey "" prtg
  ##  Ctrl+l: clear screen
bindkey "" tmux-clear-screen

##**  backspace: fix backspace issues
bindkey "" backward-delete-char

##**  Ctrl+w: delete word backwards
bindkey "" backward-kill-word

##**  fix terminal keys (readline replacement)
  ##  esc key
bindkey -M viins ""       vi-cmd-mode
bindkey -M vicmd ""       vi-insert
  ##  insert key
bindkey -M viins "[2~"    vi-cmd-mode
bindkey -M vicmd "[2~"    vi-insert
bindkey -M viins "[4h"    vi-cmd-mode
bindkey -M vicmd "[4h"    vi-insert
  ##  delete key
bindkey "[3~"             delete-char
bindkey "[P"              delete-char
  ##  home key
bindkey "[1~"             beginning-of-line
bindkey "[H"              beginning-of-line
bindkey "[7~"             beginning-of-line
  ##  end key
bindkey "[4~"             end-of-line
bindkey "[F"              end-of-line
bindkey "[8~"             end-of-line
  ##  pgup key
bindkey "[5~"             beginning-of-history
  ##  pgdn key
bindkey "[6~"             end-of-history

##**  vi keybinds
  ##  undo typing
bindkey -M vicmd "u"  undo
  ##  redo typing
bindkey -M vicmd "" redo

##**  menu select binds (completion menu)
  ##  enter runs the command
bindkey -M menuselect ''  .accept-line
  ##  navigation
bindkey -M menuselect 'h'   vi-backward-char
bindkey -M menuselect 'k'   vi-up-line-or-history
bindkey -M menuselect 'l'   vi-forward-char
bindkey -M menuselect 'j'   vi-down-line-or-history


##***************************************
##**  global aliases
##***************************************

##**  for git/hg
  ##  quick repository
alias -g UP="@{upstream}"
alias -g OUT="@{upstream}.."
alias -g IN="..@{upstream}"


##***************************************
##**  suffix aliases
##***************************************

##**  set file extensions
##***************************************
  ##  text/code
typeset -a _text=(
    asm awk
    c cfg coffee conf config cpp cs css csv
    diff
    env sps etx ex example
    git gitignore go
    h hs htm html
    info ini
    java jhtm js jsm json jsp
    lisp log lua
    map markdown md mf mfasl mi mkd mtx
    nfo
    pacnew patch pc pfa php pid PKGBUILD pl PL pm pod py
    rb rc rdf ru
    sed sfv signature sty sug
    t tcl tdy tex textile tfm tfnt theme txt
    urlview
    vim viminfo
    xml
    yml
)

  ##  audio
typeset -a _audio=(
    flac
    mp3
    oga
)

  ##  video
typeset -a _video=(
    avi
    flv
    m4v mkv mp4 mov
    ogv
    wmv
)

  ##  pictures
typeset -a _pics=(
    gif
    jpeg
    png
    svg
)


##**  set aliases
##***************************************
  ##  text files be open by vi
for ext in ${_text[@]}
do
    alias -s $ext="${EDITOR:-vi}"
done
unset ext
  ##  audio files be open by mpv
for ext in ${_audio[@]}
do
    alias -s $ext="${MOVPLAY}"
done
unset ext
  ##  video files be open by mpv
for ext in ${_video[@]}
do
    alias -s $ext="${MOVPLAY}"
done
unset ext
  ##  picture files be open by sxiv
for ext in ${_pics[@]}
do
    alias -s $ext="${PICVEIW}"
done
unset ext
  ##  ssh files
for ext in se
do
    alias -s $ext="/usr/bin/ssh"
done
unset ext
  ##  unset arrays
builtin unset _text _audio _video _pics


##***************************************
##**  aliases
##***************************************

##**  command shorts
##***************************************
  ##  weather
#alias WT-O="/usr/bin/curl 'http://wttr.in/Ocala'"
#alias WT-S="/usr/bin/curl 'http://wttr.in/Southampton'"
  ##  history
#alias h=" history"
  ##  zmv
alias zmv="noglob zmv"
  ##  clear
alias C="clear"
  ##  exit
alias q="Q"
alias qs="exit"

##**  cd family
##***************************************
  ##  less typing, more like dos
alias cd..="cd .."
  ##  navigate back n dirs
#alias .2="cd ../.."
#alias .3="cd ../../.."
#alias .4="cd ../../../.."
#alias .5="cd ../../../../.."
#alias ...=".2"
#alias ....=".3"
#alias .....=".4"
#alias ......=".5"
  ##  vertical dirs stack list
alias dirs="dirs -v"

##**  listing
##***************************************
  ##  base ls
alias ls="command ls ${ls_options[@]}"
  ##  vertical short list
alias lx="ls -1"
  ##  shorten ll -> l
alias l=ll
  ##  show hidden files also
alias la="ll -A"
  ##  show only hidden files/dirs
#alias l.="ls -d .*(/) .*"
  ##  vertical short list (hidden included)
#alias lxa="ls -1 -A"
  ##  long list (hidden included)
#alias lxl="ls -1 -L"

##**  add confirmations
##***************************************
  ##  core utils
alias cp="command cp -i"
alias rm="command rm -I --preserve-root"
alias mv="command mv -i"
  ##  ch*
alias chown="command chown --preserve-root"
alias chmod="command chmod --preserve-root"
alias chgrp="command chgrp --preserve-root"

##**  assume recursive
##***************************************
  ##  coreutils
alias cpr="cp -r"
alias rmr="rm -r"

  ##  tree list
alias tree="command tree -C"
  ##  short tree (default:2)
alias lt="tree -pL 2"
alias lt5="tree -pL 5"
  ##  tree show hidden
alias lta="lt -a"

##**  editor
##***************************************
  ##  vi is vim
#alias vim=${EDITOR}
  ##  sudo vi preserve env
#alias svi="command sudo -E vi"
  ##  emacs is vi
#alias emacs=vi
#alias emacs="emacsclient -tty"
  ##  no plugins/vimrc
#alias vvi="vi -N -u NONE"
  ##  vim splits
#alias vsp="vi -O"
#alias vsph="vi -o"

##**  application aliases
##***************************************
  ##  add default cfg to trc
#alias trc="command transmission-remote-cli -f ${TRANSMISSION_HOME:-${XDG_CONFIG_HOME:-${HOME}/.config}/transmission-daemon}/trcli.cfg"
  ##  shorten transmission-remote
#alias trm="command transmission-remote"
  ##  default options for wget
#alias wget="command wget -c --progress=bar:force:noscroll --show-progress --hgst-file=${XDG_CONFIG_HOME}/.wget-hsts"
  ##  wget with minimal verbosity
#alias vget="wget --no-verbose"
  ##  wget with no verbosity
#alias qget="wget --quiet"

##**  system tools
##***************************************
  ##  iptables list (include chain at end to see specific chain. ie: ipl INPUT to show INPUT chain)
alias ipl="command iptables -nv --line-numbers -L"
alias ip6l="command ip6tables -nv --line-numbers -L"
  ##  systemd list units
#alias sdlu="command systemctl list-units"
  ##  systemd list timers
#alias sdlt="command systemctl list-timers"
  ##  shorthand for systemctl
#alias syctl="command systemctl"
  ##  alias sudo to its command bin
#alias sudo="command sudo "

##**  update settings
##***************************************
  ##  zshrc
alias Z="builtin source ${ZDOTDIR:-${HOME}}/.zshrc"
  ##  Xdefaults
alias X="command xrdb -load ${HOME}/.Xresources"
  ##  i3wm
alias W="command i3-msg restart"


##**************************************
##**  functions
##**************************************

##**  nested functions
##***************************************
  ##  color output
function func_colors(){
    ##  variables
    local -a zprompt unload load
    local choice=1

    ##  sanity check
    if (( ${#argv} > 1 ));then
        choice=0
    elif (( ${#argv} == 1 ));then
        ##  get choice
        zparseopts -D -E p=zprompt l=load u=unload
        (( ${#load} != 0 )) && choice=1
        (( ${#zprompt} != 0 )) && choice=2
        (( ${#unload} != 0 )) && choice=0
    else
        ##  check if colors are set
        (( MY_FUNC_COLORS != 0 )) && choice=0
    fi

    ##  set variable
    (( choice != 0 )) && export MY_FUNC_COLORS=1

    ##  do the action
    case "${choice}" in
        (0)
            builtin unset MY_FUNC_COLORS
            builtin unset blk red grn ylw blu mag cyn wht
            builtin unset dblk dred dgrn dylw dblu dmag dcyn dwht
            builtin unset bbg off
        ;;
        (2)
            ##  regular colors
            blk=$'%{\e[1;30m%}'; red=$'%{\e[1;31m%}'; grn=$'%{\e[1;32m%}';
            ylw=$'%{\e[1;33m%}'; blu=$'%{\e[1;34m%}'; mag=$'%{\e[1;35m%}';
            cyn=$'%{\e[1;36m%}'; wht=$'%{\e[1;37m%}'
            ##  dim colors
            dblk=$'%{\e[0;30m%}'; dred=$'%{\e[0;31m%}'; dgrn=$'%{\e[0;32m%}';
            dylw=$'%{\e[0;33m%}'; dblu=$'%{\e[0;34m%}'; dmag=$'%{\e[0;35m%}';
            dcyn=$'%{\e[0;36m%}'; dwht=$'%{\e[0;37m%}'
            ##  misc colors
            bbg=$'\e[40m'; off=$'\e[0m'
        ;;
        (1)
            ##  regular colors
            blk=$'\e[1;30m'; red=$'\e[1;31m'; grn=$'\e[1;32m';
            ylw=$'\e[1;33m'; blu=$'\e[1;34m'; mag=$'\e[1;35m';
            cyn=$'\e[1;36m'; wht=$'\e[1;37m'
            ##  dim colors
            dblk=$'\e[0;30m'; dred=$'\e[0;31m'; dgrn=$'\e[0;32m';
            dylw=$'\e[0;33m'; dblu=$'\e[0;34m'; dmag=$'\e[0;35m';
            dcyn=$'\e[0;36m'; dwht=$'\e[0;37m'
            ##  misc colors
            bbg=$'\e[40m'; off=$'\e[0m'
        ;;
    esac
    return 0
}


##**  programs made almost not terrible
##***************************************
  ##  tranny cli
  ##  TODO: might want to add verbosity..maybe..
  ##  TODO: a usage message wouldnt kill us..although, is it really necessary..
function trc(){
    ##  >>  set variables
    DAEMON_UP=$(command ps aux | awk '/[t]ransmission-daemon/' | wc -l)
    CONFIG="${TRANSMISSION_HOME:-${XDG_CONFIG_HOME:-${HOME}/.config}/transmission-daemon}/trcli.cfg"

    ##  >>  start daemon if not up
    if (( DAEMON_UP == 0 ));then
        sudo systemctl start transmission.service
        sleep 2s
    fi

    ##  >>  run with config if present
    if [[ -r "$CONFIG" ]];then
        command transmission-remote-cli -f ${TRANSMISSION_HOME:-${XDG_CONFIG_HOME:-${HOME}/.config}/transmission-daemon}/trcli.cfg
    else
        command transmission-remote-cli
    fi
}

  ##  add torrent(s)/magnet(s) to tranny
  ##  TODO: a usage message wouldnt kill us
function trma(){
    ##  >>  check for url
    (( ${#argv} == 0 )) && return 1

    ##  >>  try adding to tranny
    for url in ${@};do
        command transmission-remote -a $url &>/dev/null || print "'${url}' is not a valid torrent"
        shift
    done
}

  ##  single operations for tranny

  ##  long listing
function ll(){
    command ls -Flh \
        --color=always \
        --group-directories-first \
        --time-style=long-iso \
        ${@} \
        | awk '{$2=$3=$4=$6=$7="";print}' \
        | sed 's/[[:space:]][[:space:]]\+/\t/g' \
        | sed 's/->/→/'
}

  ##  list symlinks
function lk(){
    command ls -FlhA \
        --color=always \
        --group-directories-first \
        --time-style=long-iso \
        ${@} \
        | awk '/^l/' \
        | sed 's/^l.*[0-9] //;s/->/→/' \
        | column -t
}

  ##  list directories
function ld(){
    command ls -FlhA \
        --color=always \
        --group-directories-first \
        --time-style=long-iso \
        ${@} \
        | awk '/^d/' \
        | sed 's/^d.*[0-9] //'
}

  ##  smarter cd
function cd(){
    if (( ${#argv} == 1 )) && [[ -f ${1} ]]; then
        [[ ! -e ${1:h} ]] && return 1
        func_colors -l
        print "${red}${bbg}::  ${cyn}cd${mag}()${wht}:${off} Correcting ${ylw}${1}${off} to ${blu}${1:h}${off}"
        func_colors -u
        builtin cd ${1:h}
    else
        builtin cd "$@"
    fi
}

  ##  make a directory and change to it
  ##  TODO: fix usage message
function mkcd(){
    (( ARGC != 1 )) &&
        print 'usage: mkcd <new-directory>' &&
        return 1
    [[ ! -d "$1" ]] &&
        command mkdir -p "$1"
    builtin cd "$(pwd)/${1}"
}


##**  some keybound functions
##***************************************
  ##  quit the shell
function Q(){
    (( EUID == 0 )) &&
        exit
    [[ -n $TMUX ]] &&
        [[ "$(tmux list-panes -s | wc -l)" == 1 ]] &&
        command i3-msg 'kill' 1>/dev/null 2>&1 ||
        exit
}
zle -N Q

  ##  enable error code debugging
function dbt(){
    [[ -o print_exit_value ]] \
        && unsetopt print_exit_value \
        || setopt print_exit_value
}
zle -N dbt

  ##  toggle between prompts
function prtg(){
    zstyle -g mode ":pr_willmcgr:" mode
    case "${mode}" in
        ('full')      zstyle ':pr_willmcgr:' mode compct ;;
        ('compact')   zstyle ':pr_willmcgr:' mode bare   ;;
        ('bare')      zstyle ':pr_willmcgr:' mode full   ;;
    esac
}
zle -N prtg

  ##  fixes tmux ^L behaviour
function tmux-clear-screen(){
    for line in {1..$(( $LINES ))} ; do echo; done
    zle clear-screen
}
zle -N tmux-clear-screen


##**  archiving tools
##***************************************
  ##  compress file(s)/dir(s) into an archive/compressed file
  ##  TODO: needs alot of work
function c(){
    ##  >>  set variables
    local usage=1
    func_colors -l

    ##  >>  usage message
    (( usage != 0 )) &&
        print "${red}${bbg}::  ${cyn}c${mag}()${wht}:${off}\t${ylw}Usage${wht}:\t${grn}c ${blu}-${blk}[${blu}zt${blk}] ${blk}<${dylw}file${blk}>${wht} -- ${blk}{${dgrn}file${blk}|${dblu}dir${ylw}0${blk}..${ylw}N${blk}}${off}" &&
        print "\t\t\t${blu}-z${blk}\t--\t${wht}Create a ${blu}zip${dylw} file${off}" &&
        print "\t\t\t${blu}-t${blk}\t--\t${wht}Create a ${blu}tar.gz${dylw} fiie${off}" &&
        print "" &&
        print "\t\t${red}NOTE${wht}:${off}\tOnly one of ${blu}-t${off} and ${blu}-z${off} can be used." &&
        print "\t\t\t  ${blu}-z${off} has dominance and will be used if both ${blu}-t${off} and ${blu}-z${off} are ommitted." &&
        print "\t\t\t  If no ${blk}<${dylw}file${blk}>${off} is given a dated name will be generated." &&
#        print "" &&
#        print "\t\t\t${blu}-v${blk}\t--\t${off}" &&
#        print "" &&
        func_colors -u &&
        return 0
}

  ##  extract files from an archive/compressed file
  ##  TODO: needs alot of work
function x(){
    ##  >>  set variables
    local usage=1
    func_colors -l

    ##  >>  usage message
    (( usage != 0 )) &&
        print "${red}${bbg}::  ${cyn}x${mag}()${wht}:${off}\t${ylw}Usage${wht}:\t${grn}x ${blu}-d${wht} -- ${blk}<${dylw}file${blk}> ${off}" &&
        print "\t\t\t${blu}-d${blk}\t--\t${wht}Delete original ${dgrn}archive${blk}/${dgrn}compressed${wht} file.${off}" &&
#        print "\t\t\t${blu}-v${blk}\t--\t${off}" &&
#        print "" &&
        func_colors -u &&
        return 0
}

  ##  backup a directory/files to another location
  ##  TODO: needs alot of work
function bkp(){
    ##  >>  set variables
    local usage=1
    func_colors -l

    ##  >>  usage message
    (( usage != 0 )) &&
        print "${red}${bbg}::  ${cyn}bkp${mag}()${wht}:${off}\t${ylw}Usage${wht}:\t${grn}bkp ${blu}-p ${blk}<${dylw}profile_name${blk}>${off}" &&
        print "\t\t\t${blu}-p${blk}\t--\t${wht}Do backup of profile ${blk}<${dylw}profile_name${blk}>${off}" &&
        print "" &&
        print "\t\t\t${dylw}profile_name${wht}:\t${dgrn}dotfiles${blk}\t--${off}\tBackup your ${wht}'${blu}~/src/@dotfiles${wht}'${off} dotfiles..." &&
        print "\t\t\t\t\t${dgrn}musicdb  ${blk}\t--${off}\tBackup your ${wht}'${blu}~/usr/media/audio${wht}'${off} folder..." &&
        print "\t\t\t\t\t${dgrn}videodb  ${blk}\t--${off}\tBackup your ${wht}'${blu}~/usr/media/video${wht}'${off} folder..." &&
        print "\t\t\t\t\t${dgrn}home     ${blk}\t--${off}\tBackup your ${wht}'${blu}~/usr${wht}'${off} folder..." &&
#        print "" &&
#        print "\t\t\t${blu}-v${blk}\t--\t${off}" &&
#        print "" &&
        func_colors -u &&
        return 0
}


##**  admin level tasks
##***************************************
  ##  revert iptables firewall to DROP ALL
function ipd(){
    (( EUID != 0 )) && return 1
    func_colors -l
    if ps aux | grep "[i]ptables";then
        command iptables-save >! /etc/iptables/current-ipv4-$(date +%y%m%d_%H%M%S).rules
        command iptabls-restore < /etc/iptables/DROPALL-ipv4.rules
    else
        print "${bbg}${red}::  ${cyn}ipd${mag}()${wht}:${off}\t${red}ERROR${wht}:\tiptables ${dgrn}ipv4${wht} firewall is not running...${off}"
    fi
    if ps aux | grep "[i]p6tables";then
        command ip6tables-save >! /etc/iptables/current-ipv6-$(date +%y%m%d_%H%M%S).rules
        command ip6tables-restore < /etc/iptables/DROPALL-ipv6.rules
    else
        print "${bbg}${red}::  ${cyn}ipd${mag}()${wht}:${off}\t${red}ERROR${wht}:\tiptables ${dgrn}ipv6${wht} firewall is not running...${off}"
    fi
    func_colors -u
}

  ##  grep for running procs
function any(){
    emulate -L zsh
    unsetopt ksh_arrays

    if (( ${#argv} < 1 )); then
        print ""
        return 1
    else
        command ps xauwww | grep -i "${grep_options[@]}" "[${1[1]}]${1[2,-1]}"
    fi
}


##**  edit primary config files
##***************************************
  ##  list edit functions
function e(){
    command clear
    func_colors -l

#          ::***********************************************************************************::
#          ::  command  :|:  description                               :|:  progress state      ::
#          ::***********:|:********************************************:|:**********************::
#          ::    eZ     :|:    edits '~/.zsh/.zshrc'                   :|:    in-progress       ::
#          ::    eE     :|:    edits '~/.zshenv'                       :|:    in-progress       ::
#          ::    eP     :|:    edits '~/.zsh/.zprofile'                :|:    in-progress       ::
#          ::***********:|:********************************************:|:**********************::
#          ::    eV     :|:    edits '~/.vimrc'                        :|:    in-progress       ::
#          ::    eN     :|:    edits '~/.vim/colors/nameless.vim'      :|:    in-progress       ::
#          ::***********:|:********************************************:|:**********************::
#          ::    eM     :|:    edits '~/.tmux.conf'                    :|:    in-progress       ::
#          ::    eT     :|:    edits '~/etc/termite/config'            :|:    in-progress       ::
#          ::***********:|:********************************************:|:**********************::
#          ::    e3     :|:    edits '~/.i3/config'                    :|:    in-progress       ::
#          ::    eB     :|:    edits '~/.i3/blocks.config'             :|:    in-progress       ::
#          ::***********:|:********************************************:|:**********************::
# TEMPLATE ::    e_     :|:    edits __________________________________:|:    in-progress       ::
#          ::***********************************************************************************::

    print "${blk}::${dcyn}***********************************************************************************${blk}::${off}"
    print "${blk}::${ylw}  command  ${blk}:${blu}|${blk}:${grn}  description                               ${blk}:${blu}|${blk}:${red}  progress state      ${blk}::${off}"
    print "${blk}::${dcyn}***********${blk}:${blu}|${blk}:${dcyn}********************************************${blk}:${blu}|${blk}:${dcyn}**********************${blk}::${off}"
    print "${blk}::${grn}    eZ     ${blk}:${blu}|${blk}:${wht}    edits ${mag}'${blu}~/.zsh/.zshrc${mag}'${wht}                   ${blk}:${blu}|${blk}:${dred}    in-progress       ${blk}::${off}"
    print "${blk}::${grn}    eE     ${blk}:${blu}|${blk}:${wht}    edits ${mag}'${blu}~/.zshenv${mag}'${wht}                       ${blk}:${blu}|${blk}:${dred}    in-progress       ${blk}::${off}"
    print "${blk}::${grn}    eP     ${blk}:${blu}|${blk}:${wht}    edits ${mag}'${blu}~/.zsh/.zprofile${mag}'${wht}                ${blk}:${blu}|${blk}:${dred}    in-progress       ${blk}::${off}"
    print "${blk}::${dcyn}***********${blk}:${blu}|${blk}:${dcyn}********************************************${blk}:${blu}|${blk}:${dcyn}**********************${blk}::${off}"
    print "${blk}::${grn}    eV     ${blk}:${blu}|${blk}:${wht}    edits ${mag}'${blu}~/.vimrc${mag}'${wht}                        ${blk}:${blu}|${blk}:${dred}    in-progress       ${blk}::${off}"
    print "${blk}::${grn}    eN     ${blk}:${blu}|${blk}:${wht}    edits ${mag}'${blu}~/.vim/colors/nameless.vim${mag}'${wht}      ${blk}:${blu}|${blk}:${dred}    in-progress       ${blk}::${off}"
    print "${blk}::${dcyn}***********${blk}:${blu}|${blk}:${dcyn}********************************************${blk}:${blu}|${blk}:${dcyn}**********************${blk}::${off}"
    print "${blk}::${grn}    eM     ${blk}:${blu}|${blk}:${wht}    edits ${mag}'${blu}~/.tmux.conf${mag}'${wht}                    ${blk}:${blu}|${blk}:${dred}    in-progress       ${blk}::${off}"
    print "${blk}::${grn}    eT     ${blk}:${blu}|${blk}:${wht}    edits ${mag}'${blu}~/etc/termite/config${mag}'${wht}            ${blk}:${blu}|${blk}:${dred}    in-progress       ${blk}::${off}"
    print "${blk}::${dcyn}***********${blk}:${blu}|${blk}:${dcyn}********************************************${blk}:${blu}|${blk}:${dcyn}**********************${blk}::${off}"
    print "${blk}::${grn}    e3     ${blk}:${blu}|${blk}:${wht}    edits ${mag}'${blu}~/.i3/config${mag}'${wht}                    ${blk}:${blu}|${blk}:${dred}    in-progress       ${blk}::${off}"
    print "${blk}::${grn}    eB     ${blk}:${blu}|${blk}:${wht}    edits ${mag}'${blu}~/.i3/blocks.config${mag}'${wht}             ${blk}:${blu}|${blk}:${dred}    in-progress       ${blk}::${off}"
    print "${blk}::${dcyn}***********************************************************************************${blk}::${off}"

    func_colors -u
    return 0
}

  ##  (e)dit (z)shrc
  ##  TODO: needs alot of work
function eZ(){
    ##  >>  set variables
    local ecmd="${EDITOR:-vi} ${rcfile}"
    [[ "${1}" == "-s" ]] && local ecmd+=" -O ${rcfile}"
}

  ##  (e)dit zsh(e)nv
  ##  TODO: needs alot of work
function eE(){
    ##  >>  set variables
    local ecmd="${EDITOR:-vi} ${rcfile}"
    [[ "${1}" == "-s" ]] && local ecmd+=" -O ${rcfile}"
}










####  OLD FUNCTIONS: NEEDS REVISITING  ####

##**  coreutils
##***************************************
  ##  cp and follow
#function cpf(){
#    cp "${@}" && goto $_
#}

  ##  mv and follow
#function mvf(){
#    mv "${@}" && goto $_
#}

  ##  follow a file opperation
#function goto(){
#    [[ -d "${1}" ]] && cd "${1}" || cd "$(dirname ${1})"
#}

  ##  change dir and list contents
#function cl(){
#    emulate -L zsh
#    cd $1 && ls -a
#}

  ##  .. is smarter
  ##  TODO: fix this up so it works
#function ..(){
#    (( $# == 0 )) && cd .. && return
#    local match_idx
#    local -a parents matching_parents new_path
#    parents=( ${(s:/:)PWD} )
#    matching_parents=( ${(M)${parents[1,-2]}:#"${1}"*} )
#    if (( ${#matching_parents} )); then
#        match_idx=${parents[(i)${matching_parents[-1]}]}
#        new_path=( ${parents[1,${match_idx}]} )
#        echo "/${(j:/:)new_path}"
#        return $?
#    fi
#    return 1
#}


##**  fun tricks and other misc shorts
##***************************************
  ##  generate a random password of a given length
  ##  TODO: fix usage message
#function genpass() {
#    (( ${#argv} == 0 )) &&
#        print "[USAGE]:\tgenpass <password_length>" &&
#        return 1
#    command dd if=/dev/urandom count=1 2>/dev/null | tr -cd 'A-Za-z0-9' | cut -c-$1
#}

  ##  find definition of a given word
#function dict(){
#    command curl "dict://dict.org/d:${1}:*"
#}

  ##  check spelling of a given word
#function spck(){
#    echo ${1} \
#        | aspell -a \
#        | awk "/${1}/" \
#        | cut -d":" -f2 \
#        | tr "," "\n" \
#        | tr -d "^ " 
#}


##**  admin level tasks
##***************************************
  ##  revert iptables firewall to DROP ALL
#function ipd(){
#    (( EUID != 0 )) && return 1
#    command iptables-save >! /etc/iptables/current-ipv4-$(date +%y%m%d_%H%M%S).rules
#    command iptabls-restore < /etc/iptables/DROPALL-ipv4.rules
#    command ip6tables-save >! /etc/iptables/current-ipv6-$(date +%y%m%d_%H%M%S).rules
#    command ip6tables-restore < /etc/iptables/DROPALL-ipv6.rules
#}

  ##  grep for running procs
#function any(){
#    emulate -L zsh
#    unsetopt ksh_arrays
#
#    if (( ${#argv} < 1 )); then
#        print ""
#        return 1
#    else
#        command ps xauwww | grep -i "${grep_options[@]}" "[${1[1]}]${1[2,-1]}"
#    fi
#}


##**  program wrappers
##***************************************
  ##  package manager
  ##  TODO: needs alot of work, as it is empty...
#function pkg(){
#}






  ##  preview-ish a md file in terminal ( requires pip mdv )
  ##  TODO: add a usage message
#function mdv(){
#    ##  check args
#    (( ${#argv} > 1 )) && return 1
#    (( ${#argv} == 1 )) && file="${1}" || file="README.md"
#    func_colors
#    trap "func_colors && trap - INT QUIT && return 1" INT QUIT
#    [[ -r "${file}" ]] && while true
#        do
#            count=10
#            command clear
#            command mdv -t 873.2866 ${file}
#            print "${ylw}Ctrl+c ${wht}: ${dred}Quit${off}\n\n"
#            while (( count > 0 ))
#            do
#                print "\r\e[K\e[1A\r\e[K\e[1A"
#                print "${grn}Refresh${wht} in ${red}${count}${wht} second(s)${off}"
#                sleep 1s
#                count=$((count-1))
#            done
#        done
#    func_colors
#    return 0
#}

  ##  download a torrent file to watch dir
  ##  TODO: fix usage message
#function gtor(){
#    ##  check args
#    (( ${#argv} == 0 || ${#argv} > 2 )) &&
#        print "[USAGE]:    gtor [<name>] <url>" &&
#        return 1
#    (( ${#argv} == 1 )) &&
#        { url="$1" && name="tor_$(date +'%F_%T')" ;} ||
#        { url="$2" && name="$1" ;}
#
#    ##  download
#    command wget -q \
#        --user-agent="firefox" \
#        --show-progress \
#        --progress=bar:force:noscroll \
#        -O ${XDG_DOWNLOAD_DIR}/torrents/add/${name}.torrent \
#        ${url}
#}

  ##  download a video/videos using youtube-dl
  ##  TODO: fix usage message
  ##  TODO: fix for multi args
#function yt(){
#    ##  check args
#    (( ${#argv} == 0 )) && print "[USAGE]:    yt -<youtube-dl options> -u <url>" && return 1
#
#    ##  variables
#    url="${1}"
#    dafile="${XDG_DOWNLOAD_DIR:-${HOME}/usr/gets}/.download_archive"
#    ydlopt=( --download-archive $dafile )
#    URLck="$(command youtube-dl --skip-download $url 2>&1 | grep -oE "ERROR:.*(stream key|Unsupported URL)")"
#
#    ##  check url
#    [[ -n ${URLck} ]] && print "[ERROR]:    ${URLck/*: /}" && return 2
#
#    ##  download loop: kill with Ctrl+\
#    while true
#    do
#        command youtube-dl ${ydlopt[@]} -- $url && break
#    done
#}


##**  archiving tools
##***************************************
  ##  compress file(s)/dir(s) into an archive/compressed file
  ##  TODO: needs alot of work
#function c(){
#    ##  >>  init stuffs
#    (( MY_FUNC_COLORS )) || func_colors
#    local usage=0 arname
#    local -a halp tarball zipfile targets verbose
#
#    ##  >>  check for null args
#    (( ${#argv} == 0 )) && usage=$((usage+1))
#
#    ##  >>  parse options
#    zparseopts -D -E h+=halp -help+=halp t+::=tarball z+::=zipfile
#    if (( usage == 0 && ${#halp} == 0 ))
#    then
#        if (( ${#zipfile} != 0 ))
#        then
#            arname="${${zipfile#*-z}:-zip-$(date +%y%m%d_%H%M%S)}.zip"
#        elif (( ${#tarball} != 0 ))
#        then
#            arname="${${tarball#*-t}:-targz-$(date +%y%m%d_%H%M%S)}.tar.gz"
#        else
#            arname="zip-$(date +%y%m%d_%H%M%S).zip"
#        fi
#        (( verbose != 0 )) &&
#            print "::  c():\tMSG:\ttarget name '$arname'..."
#    fi
#
#    ##  >>  get file names
#    if (( usage == 0 && ${#halp} == 0 ))
#    then
#        for file in $@
#        do
#            [[ -f "${file}" || -d "${file}" ]] &&
#                targets+=( "${file}" )
#        done
#    fi
#    ##  >>  print error message
#    (( usage != 0 || ${#halp} != 0 || ${#targets} == 0 )) &&
#        print "${red}${bbg}::  ${cyn}c${mag}()${wht}:${off}\t${grn}Usage${wht}:${off}" &&
#        print "\t\t${cyn}c${off} -[tz] <archive_name> -- ( files &| dirs ) " &&
#        print "\t\t${cyn}c${off} -[tz] <archive_name> -v -- ( files &| dirs ) " &&
#        print "\t\t\t${blu}-t${off}\t--\tlocation of target tarball (gz)${off}" &&
#        print "\t\t\t${blu}-z${off}\t--\tlocation of target zip archive${off}" &&
#        print "\t\t${red}NOTE${blk}:${off}\tOnly one of ${blu}-t${off} and ${blu}-z${off} will be used. (${blu}-z${off} has dominance)${off}" &&
#        print "\t\t\t${off}Also if neither is specified a zip archive with a dated name will be created.${off}" &&
#        print "\t\t\t${blu}-v${off}\t--\tturn on verbose output${off}" &&
#        func_colors &&
#        return 1
#}

  ##  extract files from an archive/compressed file
  ##  TODO: needs alot of work
#function x(){
#    ##  >>  init stuffs
#    (( MY_FUNC_COLORS )) || func_colors
#}

  ##  backup a directory/files to another location
  ##  TODO: needs alot of work
#function bkp(){
#    return 1
#    ##  usage if no args
#    func_colors
#    (( ${#argv} == 0 )) &&
#        print "${red}${bbg}::  ${cyn}bkp${mag}()${wht}:${off}\t${grn}Usage${wht}:${off}" &&
#        print "\t\t${cyn}bkp${off} -p -v " &&
#        print "\t\t\t${blu}-p${off}\t--\tpredefined profile to backup${off}" &&
#        print "\n\t\t\t\t${off}can be any of:${off}" &&
#        print "\t\t\t\t${grn}home${blk}\t--\tbackup files in ${HOME}/usr${off}" &&
#        print "\t\t\t\t${grn}dots${blk}\t--\tbackup dotfiles${off}" &&
#        print "\t\t\t\t${grn}media${blk}\t--\tbackup ${HOME}/usr/media${off}" &&
#        print "\t\t\t\t${grn}etc ${blk}\t--\tbackup modified system configs${off}\n" &&
#        print "\t\t\t\t${grn}all ${blk}\t--\t${off}" &&
#        print "\t\t\t${blu}-v${off}\t--\tturn on verbose output${off}" &&
#        func_colors &&
#        return 1
#}


##**  edit primary config files
##***************************************
  ##  (e)dit (z)shrc
  ##  TODO: needs alot of work
#function eZ(){
#    ##  >>  set variables
#    func_colors -l
#    local rchash1 rchash2 CONFIRM
#    local title="vi[zshrc]"
#    local name="eZ"
#    local username="will"
#    local rcfile="/home/${username}/.zsh/.zshrc"
#    local rtfile="/root/.zshrc"
#    local ecmd="${EDITOR:-vi} ${rcfile}"
#    [[ "${1}" == "-s" ]] && local ecmd+=" -O ${rcfile}"
#    local ucmd="command cp ${rcfile} ${rtfile}"
#    local rcmd="builtin source ${rcfile}"
#
#    ##  >>  custom traps
#    trap "printf \"\r\e[K\e[1A\n%s\n\" \"${red}${bbg}::  ${cyn}${name}${mag}()${wht}:${off}\t${red}ERROR${wht}:\tInterupted by user...${off}\" && func_colors -u && return 130" INT QUIT
#    trap "printf \"\r\e[K\e[1A\n%s\n\" \"${red}${bbg}::  ${cyn}${name}${mag}()${wht}:${off}\t${red}ERROR${wht}:\tTerminated by user...${off}\" && func_colors -u && return 131" TERM KILL
#
#    ##  >>  check rcfile
#    if ! [[ -r ${rcfile} ]];then
#        print "${red}${bbg}::  ${cyn}${name}${mag}()${wht}:${off}\t${red}ERROR${wht}:\tFile '${blu}${rcfile}${wht}' is not readable...${off}"
#        trap - INT QUIT TERM KILL
#        func_colors -u
#        return 1
#    fi
#    local rchash1="$(command sha256sum ${rcfile} 2>/dev/null | cut -d" " -f2)"
#
#    ##  >>  edit rcfile
#    print "" &&
#        sleep 0.5s
#    [[ -n ${TMUX} ]] && command tmux rename-window "${title}"
#    (( EUID == 0 )) && command runuser -l ${username} -c ${ecmd} || eval ${ecmd}
#    [[ -n ${TMUX} ]] && command tmux rename-window 'cmd>'
#
#    ##  >>  check the diff
#    local rchash2="$(command sha256sum ${rcfile} 2>/dev/null | cut -d" " -f2)"
#    if [[ ${rchash1} == ${rchash2} ]];then
#        print "${red}${bbg}::  ${cyn}${name}${mag}()${wht}:${off}\t${ylw}EXIT${wht}:\tNo changes made to '${blu}${rcfile}${wht}'${off}"
#        trap - INT QUIT TERM KILL
#        func_colors -u
#        return 2
#    fi
#
#    ##  >>  copy rcfile to rtfile
#    if [[ -n ${ucmd} ]];then
#        print "${red}${bbg}::  ${cyn}${name}${mag}()${wht}:${off}\t${grn}PROMPT${wht}:\tCopy '${blu}${rcfile}${wht}' to '${ylw}${rtfile}${wht}'?  ${blk}(${grn}y${blk}/${red}N${blk})${off}"
#        read -k1 "CONFIRM? ${red}>${off} "
#        print "\r\e[K\e[1A"
#        [[ ${CONFIRM} =~ ^[Yy]$ ]] && if (( EUID == 0 ));then
#                eval ${ucmd}
#            else
#                eval "command sudo ${ucmd}"
#                print "\r\e[K\e[1A\r\e[K\e[1A"
#            fi
#    fi
#
#    ##  >>  update shell
#    if [[ -n ${rcmd} ]];then
#        print "${red}${bbg}::  ${cyn}${name}${mag}()${wht}:${off}\t${grn}PROMPT${wht}:\tReload current shell?  ${blk}(${grn}y${blk}/${red}N${blk})${off}"
#        read -k1 "CONFIRM? ${red}>${off} "
#        print "\r\e[K\e[1A"
#        [[ $CONFRIM =~ ^[Yy}$ ]] && eval ${rcmd}
#    fi
#
#    ##  >>  exit
#    print "${red}${bbg}::  ${cyn}${name}${mag}()${wht}:${off}\t${blu}MSG${wht}:\tCompleted without errors, ${ylw}Exiting${wht}...${off}"
#    trap - INT QUIT TERM KILL
#    func_colors -u
#    return 0
#
#}
  ##  (e)dit zsh(e)nv
  ##  TODO: needs alot of work
#function eE(){
#    ##  >>  set variables
#    local ecmd="${EDITOR:-vi} ${rcfile}"
#    [[ "${1}" == "-s" ]] && local ecmd+=" -O ${rcfile}"
#}
  ##  (e)dit z(p)rofile
  ##  TODO: needs alot of work
#function eP(){
#    ##  >>  set variables
#    local ecmd="${EDITOR:-vi} ${rcfile}"
#    [[ "${1}" == "-s" ]] && local ecmd+=" -O ${rcfile}"
#}
  ##  (e)dit (v)imrc
  ##  TODO: needs alot of work
#function eV(){
#    ##  >>  set variables
#    local ecmd="${EDITOR:-vi} ${rcfile}"
#    [[ "${1}" == "-s" ]] && local ecmd+=" -O ${rcfile}"
#}
  ##  (e)dit (n)ameless.vim
  ##  TODO: needs alot of work
#function eN(){
#    ##  >>  set variables
#    local ecmd="${EDITOR:-vi} ${rcfile}"
#    [[ "${1}" == "-s" ]] && local ecmd+=" -O ${rcfile}"
#}
  ##  (e)dit t(m)ux.conf
  ##  TODO: needs alot of work
#function eM(){
#    ##  >>  set variables
#    local ecmd="${EDITOR:-vi} ${rcfile}"
#    [[ "${1}" == "-s" ]] && local ecmd+=" -O ${rcfile}"
#}
  ##  (e)dit (t)ermite config
  ##  TODO: needs alot of work
#function eT(){
#    ##  >>  set variables
#    local ecmd="${EDITOR:-vi} ${rcfile}"
#    [[ "${1}" == "-s" ]] && local ecmd+=" -O ${rcfile}"
#}


##***************************************
##**  directory profiles
##***************************************

##**  enable directory profiles
##***************************************
  ##  make function
function chpwd_profiles(){
    local profile context
    local -i reexecute
    context=":chpwd:profiles:$PWD"
    zstyle -s "$context" profile profile || profile='default'
    zstyle -T "$context" re-execute && reexecute=1 || reexecute=0
    if (( ${+parameters[CHPWD_PROFILE]} == 0 )); then
        typeset -g CHPWD_PROFILE
        local CHPWD_PROFILES_INIT=1
        (( ${+functions[chpwd_profiles_init]} )) && chpwd_profiles_init
    elif [[ $profile != $CHPWD_PROFILE ]]; then
        (( ${+functions[chpwd_leave_profile_$CHPWD_PROFILE]} )) \
            && chpwd_leave_profile_${CHPWD_PROFILE}
    fi
    if (( reexecute )) || [[ $profile != $CHPWD_PROFILE ]]; then
        (( ${+functions[chpwd_profile_$profile]} )) && chpwd_profile_${profile}
    fi
    CHPWD_PROFILE="${profile}"
    return 0
}
chpwd_functions=( ${chpwd_functions} chpwd_profiles )
  ##  turn off re execution in directory
zstyle ":chpwd:profiles:*" re-execute false
  ##  debugging
zstyle ":chpwd:profiles:*" debug true

##**  profiles
##***************************************



##***************************************
##**  startup init
##***************************************

##**  prompt style:  zshrun
##***************************************
if [[ -n ${ZSHRUN} ]];then

    ##  >>  only have one instance open at a time
    [[ $(command wmctrl -lx | grep "zshrun" | wc -l) -gt 1 ]] && exit 1

    ##  >>  keep separate command history (TODO: not working now..:[ )
    HISTFILE="${RUNHISTFILE}"
    HISTSIZE=10000
    SAVEHIST=5000

    ##  >>  local options
    unsetopt ignoreeof
    unsetopt share_history

    ##  >>  local functions
    function _accept_and_quit(){
        zsh -c "${BUFFER}" &|
        unset ZSHRUN
        trap - SIGINT
        exit 0
    }
    function _deny_and_quit(){
        zsh -c " clear" &|
        unset ZSHRUN
        trap - SIGINT
        exit 0
    }
    zle -N _deny_and_quit
    zle -N _accept_and_quit

    ##  >>  bind these functions to keys
    bindkey "" _accept_and_quit
    bindkey "" _deny_and_quit

    ##  >>  handle Ctrl+C & Ctrl+\
    trap "_deny_and_quit && trap - QUIT INT" QUIT INT

    ##  >>  custom prompt
    func_colors -p
    PROMPT=""
    RPROMPT=""
    PROMPT+=" ${mag}zshrun${off} ${dgrn}>>${off} "
    func_colors -u

fi

##**  prompt style:  main prompt
##***************************************
if [[ -z ${ZSHRUN} ]];then

    ##  >>  load the prompt
    if (( EUID != 0 ));then
        if [[ -r ${ZDOTDIR:-${HOME}}/.zsh_prompt_willmcgr ]];then
            builtin source ${ZDOTDIR:-${HOME}}/.zsh_prompt_willmcgr
            ##  set precmd function
            (( ${+functions[precmd_prompt]} )) && precmd_functions+=( precmd_prompt )
        fi
    else
        PROMPT=" >> "
        RPROMPT=""
    fi

    ##  >>  load zsh syntax highlighting
    if [[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]];then
        builtin source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ZSH_HIGHLIGHT_HIGHLIGHTERS+=( brackets pattern cursor )
#        typeset -A ZSH_HIGHLIGHT_STYLES
#        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
#        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'
#        ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=magenta'
#        ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta'
    fi

    ##  >>  load zsh auto suggestions
    ##  NOTE: not behaving with syntax plugin (prompt skipping, but no segfaults)
#    if [[ -r ${ZDOTDIR:-${HOME}/.zsh}/plugins/zshautsug/zsh-autosuggestions.zsh ]];then
#        builtin source ${ZDOTDIR:-${HOME}/.zsh}/zautsg/zsh-autosuggestions.zsh
#    fi

    ##  >>  scratchpad terminal
    if [[ -n ${SCRATCH_PAD_TERMINAL} ]]
    then
        zstyle ':pr_willmcgr:' mode bare
    fi

    ##  >>  connect to tmux:main if available
    (( EUID != 0 )) && [[ -z ${TMUX} ]] && [[ -z ${SCRATCH_PAD_TERMINAL} ]] &&
        if command tmux has -t main &>/dev/null
        then
            if (( ${$(command tmux ls | grep -E "^\<main\>:.*\(\<attached\>\)$" | wc -l)//[[:space:]]/} == 0 ))
            then
                command tmux attach -t main
#            elif command tmux has -t base &>/dev/null
#            then
#                if (( ${$(command tmux ls | grep -E "^\<base\>:.*\(\<attached\>\)$" | wc -l)//[[:space:]]/} == 0 ))
#                then
#                    command tmux attach -t base
#                fi
#            else
#                command tmux new-session -s base
            fi
        else
            command tmux new-session -s main
        fi ||
        return 0

fi


