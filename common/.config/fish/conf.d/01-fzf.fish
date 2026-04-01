# ==============================================================================
# 🔍 FZF — FUZZY FINDER
# ==============================================================================

# Comando padrão: usa 'fd' (ignora .git, node_modules)
set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git --exclude node_modules"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# Aparência: Catppuccin theme + bordas arredondadas
set -gx FZF_DEFAULT_OPTS "\
--height 50% \
--layout=reverse \
--border=rounded \
--info=inline \
--prompt='🔭 ' \
--pointer='➜' \
--marker='✓' \
--separator='─' \
--scrollbar='│' \
--margin=1 \
--padding=1 \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Preview de arquivos (Ctrl+T): usa 'bat' com syntax highlighting
set -gx FZF_CTRL_T_OPTS "\
--preview 'bat --style=numbers --color=always --line-range :500 {}' \
--preview-window 'right:60%:border-left'"

# Histórico (Ctrl+R): sem preview (mais limpo)
set -gx FZF_CTRL_R_OPTS "--preview-window hidden"
