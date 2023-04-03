#!/bin/bash
# Tokyonight theme
# THEME_BG="7aa2f7"
# THEME_FG="333333"
# Melange
THEME_FG="ECE1d7"
THEME_BG="9a6062"
function _format_time()
{
    echo -n "#[fg=#${THEME_BG}]"
    echo -n "#[fg=#${THEME_FG},bg=#${THEME_BG}] $(TZ=Singapore date '+%H:%M') "
    echo -n "#[fg=#${THEME_FG},bg=#${THEME_BG}] $(TZ=Singapore date '+%d %b %Y') #[bg=default,fg=default]"
}

function _tmux_title_formatted()
{
    echo -n "#[fg=#${THEME_FG},bg=#${THEME_BG}][#S]#[bg=default,fg=default]"
    echo -n "#[fg=#${THEME_BG}]"
}
