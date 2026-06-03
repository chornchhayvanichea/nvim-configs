return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      vim.treesitter.language.register("kotlin", "kotlin")
    end,
    opts = {
      ensure_installed = { "lua", "python", "javascript" },
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
    },
  },
}
