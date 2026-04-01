function organizar
    set dir $argv[1]
    
    # Verifica se o diretório existe
    if not test -d "$dir"
        echo "❌ Diretório não encontrado: $dir"
        return 1
    end
    
    echo "📂 Organizando: $dir"
    
    # Cria a estrutura (se não existir)
    mkdir -p $dir/organizado/{imagens,documentos,videos,compactados,outros}
    
    # 1. Imagens (jpg, png, webp) - executa mv para cada arquivo encontrado
    fd -e jpg -e jpeg -e png -e webp . $dir --max-depth 1 -x mv {} $dir/organizado/imagens/
    
    # 2. Documentos (pdf, doc, docx, txt)
    fd -e pdf -e doc -e docx -e txt . $dir --max-depth 1 -x mv {} $dir/organizado/documentos/
    
    # 3. Vídeos (mp4, mkv)
    fd -e mp4 -e mkv . $dir --max-depth 1 -x mv {} $dir/organizado/videos/
    
    # 4. Compactados (zip, tar, gz)
    fd -e zip -e tar -e gz . $dir --max-depth 1 -x mv {} $dir/organizado/compactados/
    
    # 5. O Resto (Opcional: mover o que sobrou para 'outros', cuidado para não mover a própria pasta 'organizado')
    # Por segurança, vamos deixar manual por enquanto.
    
    echo "✅ Organização concluída!"
    # Mostra o resultado com seu alias de árvore
    lt $dir/organizado
end
