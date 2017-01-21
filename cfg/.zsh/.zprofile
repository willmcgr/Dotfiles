##**************************************
##    File: $dots/cfg/.zsh/.zprofile
##  Author: willmcgr
##     vim:ft=zsh:
##**************************************
##  TODO finish startx function

##  only run once
if [[ "${PROFILE_LEVEL}" == 1 ]]; then
    exit 0
fi
export PROFILE_LEVEL=1

##  default permissions 740
umask 027

##  setup trash folder
command mkdir -p -- ${HOME}/tmp/trash/$(date +'%Y/%m/%d')

##  navigate to ${HOME}/usr (if it exists) before starting x
if [[ -d ${HOME}/usr ]];then
    [[  "$(pwd)" == "${HOME}/usr" ]] ||
        builtin cd -- ${HOME}/usr
fi

##  start mpd at login
if ! [[ -e $HOME/.mpd/mpd.pid ]];then
    if hascmd mpd;then
        ( ( sleep 0.5s && command mpd ) & )
    fi
fi

##  host specific things

##  startx function
#function _startx(){
#}

##  startx at login on tty1
if [[ -z ${DISPLAY} ]] && [[ $(tty) == /dev/tty1 ]];then
    exec startx -- vt1 -keeptty &>/dev/null
    logout
elif [[ $(tty) == /dev/tty2 ]];then
    tmux attach-session -t secured ||
        tmux new-session -s secured
fi


