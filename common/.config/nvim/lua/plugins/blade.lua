return {
  -- 1. Ensinar o Neovim que .blade.php é do tipo "blade"
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })
    end,
  },

  -- 2. Configurar o formatador (Conform.nvim é o padrão do LazyVim)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        blade = { "blade-formatter" },
      },
    },
  },
}
