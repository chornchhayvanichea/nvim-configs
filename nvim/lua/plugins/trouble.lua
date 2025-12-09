-- Enable and then disable `trouble.nvim` to show example
return {
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
  { "folke/trouble.nvim", enabled = false },
}
