return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "mason",
        callback = function()
          vim.keymap.set("n", "<C-f>", function()
            local packages = require("mason-registry").get_all_package_names()
            require("fzf-lua").fzf_exec(packages, {
              prompt = "Mason> ",
              actions = {
                ["default"] = function(selected)
                  vim.cmd("MasonInstall " .. selected[1])
                end,
              },
            })
          end, { buffer = true })
        end,
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
        },
      })
    end,
  },
}
