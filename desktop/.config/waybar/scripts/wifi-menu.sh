#!/usr/bin/env bash

# --- CONFIGURAÇÕES VISUAIS ---
# Lista Grande
WOFI_LIST_ARGS="--dmenu --width 350 --height 450 --location center --style $HOME/.config/wofi/wifi.css --conf /dev/null --cache-file /dev/null"
# Janela Pequena (Senha / Ações)
WOFI_SMALL_ARGS="--dmenu --width 350 --height 210 --location center --style $HOME/.config/wofi/wifi.css --conf /dev/null --cache-file /dev/null --lines 4"
# Janela Minúscula (Input de Senha)
WOFI_PASS_ARGS="--dmenu --width 350 --height 100 --lines 0 --location center --style $HOME/.config/wofi/wifi.css --conf /dev/null --cache-file /dev/null"

# --- LISTAGEM ---
notify-send "Wi-Fi" "Escaneando redes..."
nmcli device wifi rescan

# Pega a rede atual conectada
current_ssid=$(nmcli -t -f ACTIVE,SSID dev wifi | grep "^yes" | cut -d: -f2)

# Gera lista com ícones
wifi_list=$(nmcli -t -f SSID,SECURITY device wifi list | awk -F: -v current="$current_ssid" '{
    if($1=="") next;
    icon=""; 
    if($2!="") icon=""; 
    if($1==current) icon=""; # Marca a conectada com Check
    print icon "  " $1
}' | awk '!seen[$0]++')

# Toggle
connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
  toggle="睊  Desativar Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
  toggle="直  Ativar Wi-Fi"
fi

# --- MENU PRINCIPAL ---
chosen_network=$(echo -e "$toggle\n$wifi_list" | wofi $WOFI_LIST_ARGS --prompt "Redes Wi-Fi")

if [ "$chosen_network" = "" ]; then exit; fi

# Comandos Toggle
if [ "$chosen_network" = "直  Ativar Wi-Fi" ]; then
  nmcli radio wifi on
  notify-send "Wi-Fi" "Ativado"
  exit
elif [ "$chosen_network" = "睊  Desativar Wi-Fi" ]; then
  nmcli radio wifi off
  notify-send "Wi-Fi" "Desativado"
  exit
fi

# Limpa o nome da rede
ssid=$(echo "$chosen_network" | sed 's/^...//')

# Verifica se é salva ou ativa
saved_connection=$(nmcli -g NAME connection show | grep "^$ssid$")
active_connection=$(nmcli -t -f ACTIVE,SSID dev wifi | grep "^yes:$ssid$")

# --- LÓGICA DE AÇÃO ---

if [[ -n "$saved_connection" ]]; then
  # === REDE JÁ CONHECIDA ===
  # Mostra menu de opções

  OPTIONS=""
  if [[ -n "$active_connection" ]]; then
    OPTIONS+="  Desconectar\n"
  else
    OPTIONS+="  Conectar\n"
  fi
  OPTIONS+="  Ver Senha\n"
  OPTIONS+="  Esquecer Rede"

  ACTION=$(echo -e "$OPTIONS" | wofi $WOFI_SMALL_ARGS --prompt "$ssid")

  case $ACTION in
  "  Conectar")
    notify-send "Wi-Fi" "Conectando a $ssid..."
    nmcli connection up id "$ssid" && notify-send "Wi-Fi" "Conectado!"
    ;;
  "  Desconectar")
    nmcli device disconnect wlan0 && notify-send "Wi-Fi" "Desconectado"
    # Nota: wlan0 é o padrão, se não funcionar, use 'nmcli device disconnect' no device correto
    ;;
  "  Ver Senha")
    password=$(nmcli -s -g 802-11-wireless-security.psk connection show "$ssid")
    # Mostra a senha numa janela do Wofi para poder copiar
    echo "$password" | wofi $WOFI_PASS_ARGS --prompt "Senha de $ssid:"
    ;;
  "  Esquecer Rede")
    nmcli connection delete id "$ssid" && notify-send "Wi-Fi" "Rede esquecida: $ssid"
    ;;
  esac

else
  # === REDE NOVA ===
  if [[ "$chosen_network" =~ "" ]]; then
    wifi_password=$(wofi $WOFI_PASS_ARGS --password --prompt "Senha para $ssid")
  fi

  if [[ -z "$wifi_password" && "$chosen_network" =~ "" ]]; then exit; fi

  notify-send "Wi-Fi" "Conectando a: $ssid"
  if nmcli device wifi connect "$ssid" password "$wifi_password"; then
    notify-send "Wi-Fi" "Conectado!"
  else
    notify-send "Wi-Fi" "Erro ao conectar"
  fi
fi
