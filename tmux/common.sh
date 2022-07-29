#!/bin/bash
function _format_time()
{
    echo -n "#[fg=#7aa2f7]"
    echo -n "#[fg=#333333,bg=#7aa2f7] $(TZ=Singapore date '+%H:%M') "
    echo -n "#[fg=#333333,bg=#7aa2f7] $(TZ=Singapore date '+%d %b %Y') #[bg=default,fg=default]"
}

function _tmux_title_formatted()
{
    echo -n "#[fg=#333333,bg=#7aa2f7][#S]#[bg=default,fg=default]"
    echo -n "#[fg=#7aa2f7]"
}

