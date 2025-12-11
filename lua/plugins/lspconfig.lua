return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Keybindings when LSP attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        end,
      })
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      -- ts_ls handles TypeScript in .ts files
      vim.lsp.config("ts_ls", {
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }, -- NO "vue"
        settings = {
          typescript = {
            suggest = {
              autoImports = true,
              completeFunctionCalls = true,
            },
          },
        },
      })
      vim.lsp.config("vue_ls", {
        filetypes = { "vue" },
        root_dir = require("lspconfig.util").root_pattern("package.json", ".git"),
        init_options = {
          typescript = {
            tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
          },
        },
      })
      vim.lsp.config("cssls", {
        filetypes = { "vue", "html", "css" },
      })
      vim.lsp.config("laravel_ls", {
        cmd = { "laravel-ls" },
        filetypes = { "php", "blade" },
        root_dir = require("lspconfig.util").root_pattern("artisan", ".git", "composer.json"),
      })
      vim.lsp.config("intelephense", {
        filetypes = { "php", "blade", "html" },
      })
      vim.lsp.config("emmet_ls", {
        cmd = { "emmet-ls", "--stdio" },
        filetypes = { "php", "html", "vue", "javascript", "typescript", "blade" },
      })
      -- Enable ts_ls first
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("vue_ls")
      -- Setup other LSP servers
      local servers = {
        "lua_ls",
        "ruff",
        "gopls",
        "html",
        "tailwindcss",
        "bashls",
        "jsonls",
        "marksman",
        "emmet_ls",
        "cssls",
        "laravel_ls",
        "intelephense",
      }
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end
    end,
  },
}
