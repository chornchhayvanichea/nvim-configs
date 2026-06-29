--return {
--  {
--    "echasnovski/mini.pick",
--    --    dependencies = { "nvim-tree/nvim-web-devicons" }, version = false,
--    config = function() require("mini.pick").setup({ use_cache = true, -- pass options here
--        window = {
--          config = {
--            border = "none",
--          },
--        },
--      })
-- -- Keymaps
--      vim.keymap.set("n", "<leader>f", function()
--        require("mini.pick").builtin.files()
--      end, { desc = "Find files" })
--
--      vim.keymap.set("n", "<leader><S-g>", function()
--        require("mini.pick").builtin.grep_live()
--      end)
--
--      vim.keymap.set("n", "<leader>o", function()
--        require("mini.pick").start({
--          source = {
--            items = vim.v.oldfiles,
--            name = "Old files",
--          },
--        })
--      end)
--
--      vim.keymap.set("n", "<leader>h", function()
--        require("mini.pick").builtin.help()
--      end, { desc = "Find Help" })
--
--      vim.keymap.set("n", "<leader>b", function()
--        require("mini.pick").builtin.buffers()
--      end)
--    end,
--  },
--}
return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  --  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {},
  ---@diagnostic enable: missing-fields
  config = function()
    require("fzf-lua").setup({
      files = {
        fd_opts = "--color=never --type f --follow --exclude .git",
        actions = {
          ["ctrl-h"] = { require("fzf-lua").actions.toggle_hidden },
        },
      },
      winopts = {
        preview = {
          hidden = "hidden",
        },
        fullscreen = true,
      },
    })
    vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>")
    vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>")
    vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>")
    vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>")
    vim.keymap.set("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>")
  end,
}
