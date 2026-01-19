return {
  "echasnovski/mini.ai",
  event = "BufReadPre",
  config = function()
    require("mini.ai").setup()
  end,
}
