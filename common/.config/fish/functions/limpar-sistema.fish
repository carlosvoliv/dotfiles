function limpar-sistema
    echo "=> Iniciando limpeza..."

    # 1. Órfãos (com verificação)
    set orphans (pacman -Qtdq)
    if test -n "$orphans"
        echo "-> Removendo órfãos encontrados..."
        sudo pacman -Rns $orphans
    else
        echo "-> Nenhum pacote órfão encontrado."
    end

    # 2. Cache
    echo "-> Limpando cache (mantendo 3 versões)..."

    sudo paccache -rk3
    # Ou o método nativo agressivo (remove tudo menos a atual):
    # sudo pacman -Sc --noconfirm

    echo "✅ Sistema limpo!"
end
