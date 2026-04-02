#!/bin/bash

# Script para formatar data em português para Waybar
# Salve em ~/.config/waybar/scripts/date-pt.sh
# Dê permissão de execução: chmod +x ~/.config/waybar/scripts/date-pt.sh

export LC_ALL=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
export LC_TIME=pt_BR.UTF-8

date "+%a, %d %b  %H:%M "
