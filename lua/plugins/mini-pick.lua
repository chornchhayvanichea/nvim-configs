return {
  {
    "echasnovski/mini.pick",
    --    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = false,
    config = function()
      require("mini.pick").setup({
        use_cache = true, -- pass options here
        window = {
          config = {
            border = "none",
          },
        },
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>f", function()
        require("mini.pick").builtin.files()
      end, { desc = "Find files" })

      vim.keymap.set("n", "<leader><S-g>", function()
        require("mini.pick").builtin.grep_live()
      end)

      vim.keymap.set("n", "<leader>o", function()
        require("mini.pick").start({
          source = {
            items = vim.v.oldfiles,
            name = "Old files",
          },
        })
      end)

      vim.keymap.set("n", "<leader>h", function()
        require("mini.pick").builtin.help()
      end, { desc = "Find Help" })

      vim.keymap.set("n", "<leader>b", function()
        require("mini.pick").builtin.buffers()
      end)
    end,
  },
}
