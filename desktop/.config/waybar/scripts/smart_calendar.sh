#!/bin/bash

# --- Configurações ---
ID="kitty-calendar"
CMD="kitty --class $ID --title Calendar --detach -o window_padding_width=25 -o font_size=13 -o modify_font=cell_height=10px -o confirm_os_window_close=0 -e env LC_ALL=pt_BR.UTF-8 calcure"

# --- 1. Lógica de Toggle (Abrir/Fechar) ---
# Procura pelo ENDEREÇO da janela específica
WINDOW_ADDR=$(hyprctl clients -j | jq -r ".[] | select(.class == \"$ID\") | .address")

if [[ -n "$WINDOW_ADDR" ]]; then
  # Se encontrou um endereço, fecha aquela janela específica
  hyprctl dispatch closewindow "address:$WINDOW_ADDR"
  exit
fi

# --- 2. Abre o Calendário ---
$CMD

# --- 3. Espera Inteligente de Foco ---
TIMEOUT=0
while [[ "$(hyprctl activewindow -j | jq -r ".class")" != "$ID" ]]; do
  if [ $TIMEOUT -ge 30 ]; then
    exit 1
  fi
  sleep 0.1
  ((TIMEOUT++))
done

# --- 4. Loop de Monitoramento ---
while true; do
  FOCUSED=$(hyprctl activewindow -j | jq -r ".class")

  if [[ "$FOCUSED" != "$ID" ]]; then
    # Pega o endereço de novo para garantir que estamos fechando a certa
    TARGET_ADDR=$(hyprctl clients -j | jq -r ".[] | select(.class == \"$ID\") | .address")
    if [[ -n "$TARGET_ADDR" ]]; then
      hyprctl dispatch closewindow "address:$TARGET_ADDR"
    fi
    exit
  fi

  if ! pgrep -f "kitty --class $ID" >/dev/null; then
    exit
  fi

  sleep 0.1
done
