return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      column = {},
      keymaps = {
        ["<C-l>"] = { disabled = true },
        ["<C-h>"] = { disabled = true },
        ["<C-v>"] = "actions.select_vsplit", -- Change to C-v for vertical split
        ["<C-s>"] = "actions.select_split", -- Keep C-s for horizontal split
        ["<leader>w"] = { "actions.parent", mode = "n" },
      },
      --      -- Configuration for the floating window in oil.open_float
      --      float = {
      --        -- Padding around the floating window
      --        padding = 4,
      --        -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      --        max_width = 0.7,
      --        max_height = 0.5,
      --        border = nil,
      --        win_options = {
      --          winblend = 0,
      --        },
      --        -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
      --        get_win_title = nil,
      --        -- preview_split: Split direction: "auto", "left", "right", "above", "below".
      --        preview_split = "auto",
      --        -- This is the config that will be passed to nvim_open_win.
      --        -- Change values here to customize the layout
      --        override = function(conf)
      --          return conf
      --        end,
      --      },
      --    },
      --    -- Optional dependencies
      --    --  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
      --    --  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
      --    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
      --    lazy = false,
    },
    --    vim.keymap.set("n", "<leader>e", function()
    --      require("oil").oil()
    --    end, { desc = "Open Oil in float" }),
    --  },
  },
}
