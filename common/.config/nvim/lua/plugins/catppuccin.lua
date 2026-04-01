return {
  -- 1. Instala e configura o Catppuccin com TRANSPARÊNCIA
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- Garante a paleta escura
      transparent_background = true, -- <--- AQUI ESTÁ A MÁGICA
      integrations = {
        -- Garante que janelas flutuantes e plugins também fiquem transparentes/bonitos
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    },
    -- Define o Catppuccin como o colorscheme padrão ao iniciar
    init = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- 2. Sobrescreve (Override) o Tokyo Night para DESATIVÁ-LO
  { "folke/tokyonight.nvim", enabled = false },

  -- 3. Sobrescreve a configuração da LazyVim para usar catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
