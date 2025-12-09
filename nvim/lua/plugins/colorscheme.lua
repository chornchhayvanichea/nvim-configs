---return {
---  {
---    "folke/tokyonight.nvim",
---    opts = {
---
---      transparent = true,
---      styles = {
---        type = "moon",
---        sidebars = "transparent",
---        floats = "transparent",
---      },
---    },
---  },
---}
return {
  -- add gruvbox
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
