return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- list of LSP servers
      servers = {
        pyright = {},
        tailwindcss = {
          filetypes = {
            "html",
            "php",
            "css",
            "postcss",
            "scss",
            "typescriptreact",
            "javascriptreact",
            "blade",
            "vue",
          },
        },
        laravel_ls = {
          filetypes = {
            "php",
            "blade",
          },
          settings = {},
        },
        intelephense = {
          filetypes = {
            "php",
            "blade",
            "html",
          },
        },
        json_lsp = {
          filetypes = {
            "php",
            "blade",
            "html",
            "javascriptreact",
            "typescriptreact",
          },
        },
        emmet_ls = {
          filetypes = {
            "html",
            "css",
            "blade",
            "php",
            "javascriptreact",
            "typescriptreact",
          },
        },
      },
    },
  },
}
