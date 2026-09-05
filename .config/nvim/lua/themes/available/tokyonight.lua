return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,

  opts = {
    style = "storm",

    transparent = false,
    terminal_colors = true,

    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = "dark",
      floats = "dark",
    },

    dim_inactive = false,
    lualine_bold = false,
  },

  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight-storm")

    -- Seleção de texto
    vim.api.nvim_set_hl(0, "Visual", {
      bg = "#895ec8",
      fg = "#ffffff",
    })

    -- Item selecionado em menus/autocomplete
    vim.api.nvim_set_hl(0, "PmenuSel", {
      bg = "#895ec8",
      fg = "#ffffff",
    })

    -- Bordas de janelas flutuantes
    vim.api.nvim_set_hl(0, "FloatBorder", {
      fg = "#895ec8",
      bg = "NONE",
    })

    -- Separadores entre janelas
    vim.api.nvim_set_hl(0, "WinSeparator", {
      fg = "#895ec8",
    })

    -- Cursor
    vim.api.nvim_set_hl(0, "Cursor", {
      bg = "#895ec8",
      fg = "#ffffff",
    })
  end,
}

