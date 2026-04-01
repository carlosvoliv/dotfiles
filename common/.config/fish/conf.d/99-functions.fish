# ==============================================================================
# 🛠️ FUNÇÕES CUSTOMIZADAS
# ==============================================================================

# ------------------------------------------------------------------------------
# Yazi — File manager que muda diretório ao sair
# ------------------------------------------------------------------------------
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and test -n "$cwd"; and test "$cwd" != "$PWD"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# ------------------------------------------------------------------------------
# NVM — Node Version Manager wrapper
# ------------------------------------------------------------------------------
function nvm
    /usr/bin/env bash -c "source /usr/share/nvm/nvm.sh; nvm $argv"
end

# ------------------------------------------------------------------------------
# Laravel: Cria Model + Migration + Controller de uma vez
# ------------------------------------------------------------------------------
function make:all
    if test (count $argv) -eq 0
        echo "❌ Uso: make:all NomeDoModel"
        return 1
    end

    set model $argv[1]
    php artisan make:model $model -mcr
    echo "✅ Criado: Model, Migration, Controller (Resource)"
end

# ------------------------------------------------------------------------------
# Laravel: Limpa todos os caches
# ------------------------------------------------------------------------------
function art:clear
    php artisan cache:clear
    php artisan config:clear
    php artisan route:clear
    php artisan view:clear
    composer dump-autoload
    echo "✅ Laravel limpo!"
end

# ------------------------------------------------------------------------------
# Git: Add + Commit + Push rápido
# ------------------------------------------------------------------------------
function gquick
    if test (count $argv) -eq 0
        echo "❌ Uso: gquick 'mensagem do commit'"
        return 1
    end

    git add .
    git commit -m "$argv"
    git push
    echo "✅ Commitado e enviado!"
end

# ------------------------------------------------------------------------------
# Neovim: Abre controller Laravel
# ------------------------------------------------------------------------------
function v:c
    if test (count $argv) -eq 0
        echo "❌ Uso: v:c NomeController"
        return 1
    end

    nvim app/Http/Controllers/$argv[1].php
end

# ------------------------------------------------------------------------------
# Neovim: Abre model Laravel
# ------------------------------------------------------------------------------
function v:m
    if test (count $argv) -eq 0
        echo "❌ Uso: v:m NomeModel"
        return 1
    end

    nvim app/Models/$argv[1].php
end

# ------------------------------------------------------------------------------
# Neovim: Abre migration mais recente
# ------------------------------------------------------------------------------
function v:mig
    set last_migration (ls -t database/migrations 2>/dev/null | head -1)

    if test -z "$last_migration"
        echo "❌ Nenhuma migration encontrada"
        return 1
    end

    nvim database/migrations/$last_migration
end

# ------------------------------------------------------------------------------
# Neovim: Abre routes/web.php
# ------------------------------------------------------------------------------
function v:routes
    nvim routes/web.php
end

# ------------------------------------------------------------------------------
# Logger simples
# ------------------------------------------------------------------------------
function log_msg
    echo (date +"[%H:%M:%S]") $argv >>/tmp/meu_diario_dev.txt
    echo "✅ Mensagem salva no diário!"
end

# ------------------------------------------------------------------------------
# Tickets: Inicia trabalho em novo ticket
# ------------------------------------------------------------------------------
function ticket:start
    if test (count $argv) -eq 0
        echo "❌ Uso: ticket:start ISV-1234"
        return 1
    end

    set ticket $argv[1]
    git checkout -b "feature/$ticket"
    echo "✅ Branch criada: feature/$ticket"
    log_msg "Iniciou $ticket"
end

# ------------------------------------------------------------------------------
# Tickets: Finaliza ticket (commit + push)
# ------------------------------------------------------------------------------
function ticket:done
    if test (count $argv) -lt 2
        echo "❌ Uso: ticket:done ISV-1234 'mensagem do commit'"
        return 1
    end

    set ticket $argv[1]
    set msg $argv[2..-1]

    git add .
    git commit -m "[$ticket] $msg"
    git push -u origin (git branch --show-current)
    echo "✅ Ticket $ticket commitado!"
    log_msg "Finalizou $ticket: $msg"
end

# ------------------------------------------------------------------------------
# Tickets: Lista trabalho de hoje
# ------------------------------------------------------------------------------
function ticket:log
    if test -f /tmp/meu_diario_dev.txt
        echo "📋 Log de hoje:"
        grep (date +"%Y-%m-%d") /tmp/meu_diario_dev.txt
    else
        echo "❌ Nenhum log encontrado"
    end
end
