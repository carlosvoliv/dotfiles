-- Options are automatically loaded before lazy.nvim startup
-- Default options: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.g.mapleader = " " -- Garante que a tecla Leader é o Espaço
vim.g.node_host_prog = "/usr/bin/node" -- Sua config do node

-- -----------------------------------------
-- CONFIGURAÇÕES DO TREINAMENTO KEYBOARD-FIRST
-- -----------------------------------------

-- 1. Números Relativos (CRUCIAL para pular linhas com j/k)
-- Mostra: "5 linhas pra cima" em vez de "linha 23"
vim.opt.relativenumber = true
vim.opt.number = true

-- 2. Clipboard (Integração com Sistema)
-- Permite copiar no Vim (y) e colar no navegador (Ctrl+V)
-- Requer: sudo pacman -S wl-clipboard (no Wayland/Hyprland)
vim.opt.clipboard = "unnamedplus"

-- 3. Conforto Visual
vim.opt.scrolloff = 8 -- Mantém 8 linhas de margem ao fazer scroll

-- Habilita a quebra de linha
vim.opt.wrap = true

-- Quebra apenas em palavras inteiras (não corta palavras no meio)
vim.opt.linebreak = true

-- Mantém a indentação visual na linha quebrada (muito importante para ler código)
vim.opt.breakindent = true
vim.opt.signcolumn = "yes" -- Evita que a tela "pule" quando aparecer erro

-- 4. Busca Inteligente
vim.opt.ignorecase = true -- Busca ignora maiúsculas...
vim.opt.smartcase = true -- ...a menos que você digite uma maiúscula

-- 5. Splits (Janelas divididas)
vim.opt.splitbelow = true -- Split horizontal abre embaixo
vim.opt.splitright = true -- Split vertical abre na direita

-- Define a régua na coluna 120
vim.opt.colorcolumn = "120"

-- 2. Deixa a linha BEM sutil (um cinza apenas um pouco mais claro que o fundo)
-- O "bg" define a cor de fundo. #2b2b2b é um cinza escuro discreto.
-- vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#2b2b2b" })
