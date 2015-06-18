#!/bin/bash
function _format_time()
{
    echo -n "#[fg=colour0,bg=colour120] $(TZ=Singapore date '+%H:%M') #[bg=default,fg=default] "
    echo -n "#[fg=colour0,bg=colour120] #[bg=default,fg=default] "
    echo -n "#[fg=colour0,bg=colour120] $(TZ=Singapore date '+%d %b %Y') #[bg=default,fg=default] "
}

function _tmux_title_formatted()
{
    echo -n "#[fg=colour0,bg=colour120][#S]#[bg=default,fg=default]"
}

