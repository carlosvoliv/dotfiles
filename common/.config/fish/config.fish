# ==============================================================================
# 🐟 FISH CONFIG
# ==============================================================================

if status is-interactive
    # Prompt
    starship init fish | source
    set -g fish_greeting ""

    # Keybindings Vi mode
    fish_vi_key_bindings

    # FZF (nativo Fish 4+, sem plugin)
    fzf --fish | source

    # Fix: navegação no modo insert
    bind -M insert \cf forward-char
    bind -M insert \e\[C forward-char
end

# Zoxide
zoxide init fish | source

# Hyprland auto-start no TTY1
if status is-login; and test (tty) = /dev/tty1
    exec Hyprland
end
