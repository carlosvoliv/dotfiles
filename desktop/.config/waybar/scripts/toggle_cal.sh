#!/bin/bash
# Verifica se o processo já está a correr
if pgrep -f "kitty --class kitty-calendar" >/dev/null; then
  # Se estiver aberto, fecha-o
  pkill -f "kitty --class kitty-calendar"
else
  # Se estiver fechado, abre-o
  kitty --class kitty-calendar --title 'Calendar' --detach -e calcure
fi
