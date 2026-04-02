# ==============================================================================
# 🌍 VARIÁVEIS DE AMBIENTE
# ==============================================================================

# Editor padrão
set -gx EDITOR nvim
set -gx VISUAL nvim

# Tema de ícones
set -gx QS_ICON_THEME Papirus

# PATH
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.composer/vendor/bin
fish_add_path $HOME/.npm-global/bin
