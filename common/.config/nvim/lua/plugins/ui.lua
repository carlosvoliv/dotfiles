return {
  {
    "lukas-reineke/virt-column.nvim",
    event = "VeryLazy", -- Carrega só depois que o neovim inicia (não pesa)
    opts = {
      char = "│", -- O caractere 'fino' que será desenhado
      virtcolumn = "120", -- A posição da linha (pode por "80" se preferir)
    },
    config = function(_, opts)
      require("virt-column").setup(opts)
    end,
  },
}
