#!/bin/bash
FDR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$FDR/common.sh"

echo -n " $(_tmux_title_formatted) "
