return {
  "echasnovski/mini.statusline",
  event = "BufReadPre",
  config = function()
    require("mini.statusline").setup()
  end,
}
