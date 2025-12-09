return {
 {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
   column = {},
   keymaps = {
    --      ["<C-h>"] = false,  -- Disable the default horizontal split
    ["<C-v>"] = "actions.select_vsplit", -- Change to C-v for vertical split
    ["<C-s>"] = "actions.select_split", -- Keep C-s for horizontal split
   },
  },
  -- Optional dependencies
  --  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  --  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
 },
}
