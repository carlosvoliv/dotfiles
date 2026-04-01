# ==============================================================================
# 🐟 FISH CONFIG — MINIMAL LOADER
# ==============================================================================
# Este arquivo só inicializa ferramentas interativas.
# Toda configuração real está em conf.d/
# ==============================================================================

if status is-interactive
    # Prompt
    starship init fish | source
    set -g fish_greeting ""

    # Keybindings
    fish_vi_key_bindings
    fzf_key_bindings

    # Fix: Navegação no modo insert (Vi)
    bind -M insert \cf forward-char
    bind -M insert \e\[C forward-char
end

# Zoxide (cd inteligente)
zoxide init fish | source
