return {
  -- 1. Sua configuração atual (LSP / Inteligência)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {},
      },
    },
  },

  -- 2. Configuração do Formatador (Aqui está a mágica)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Isso força o Neovim a usar APENAS o Pint para arquivos PHP.
        -- Mesmo que o php-cs-fixer esteja instalado, ele será ignorado.
        php = { "pint" },
      },
    },
  },

  -- 3. Garantia de Instalação
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- Garante que o Pint seja instalado automaticamente se sumir
      table.insert(opts.ensure_installed, "pint")
    end,
  },
}
