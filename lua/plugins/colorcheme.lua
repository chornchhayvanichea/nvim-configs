-- Colorscheme setup
return {
  {
    "sainnhe/gruvbox-material",
    lazy = false, -- load immediately
    priority = 1000,
    config = function()
      vim.cmd("colorscheme gruvbox-material")
      --      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      --      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
}
--return {
--  "Mofiqul/dracula.nvim",
--  lazy = false,
--  priority = 1000,
--  config = function()
--    vim.cmd("colorscheme dracula")
--  end,
--}
--return {
--  "shaunsingh/nord.nvim",
--  lazy = false,
--  priority = 1000,
--  config = function()
--    vim.cmd("colorscheme nord")
--  end,
--}
-- lazy.nvim
--return {
--  "folke/tokyonight.nvim",
--  lazy = false,
--  priority = 1000,
--  config = function()
--    vim.cmd("colorscheme tokyonight-storm")
--  end,
--}
