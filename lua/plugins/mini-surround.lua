return {
  {
    "echasnovski/mini.surround",
    version = false,
    event = "BufReadPre",
    config = function()
      require("mini.surround").setup()
    end,
  },
}
