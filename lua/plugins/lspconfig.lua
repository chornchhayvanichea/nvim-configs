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

      -- Get the Mason path for Vue LSP
      local vue_language_server_path = vim.fn.stdpath("data")
        .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

      -- Filetypes handled by TS
      local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }

      -- Vue TypeScript plugin
      local vue_plugin = {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
        configNamespace = "typescript",
      }

      -- Config for vtsls / ts_ls
      local ts_ls_config = {
        init_options = {
          plugins = {
            vue_plugin,
          },
        },
        filetypes = tsserver_filetypes,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
            },
          },
        },
      }

      -- Config for Vue LSP
      local vue_ls_config = {
        on_init = function(client)
          client.handlers["tsserver/request"] = function(_, result, context)
            local ts_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "ts_ls" })
            local vtsls_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
            local clients = {}

            vim.list_extend(clients, ts_clients)
            vim.list_extend(clients, vtsls_clients)

            if #clients == 0 then
              vim.notify("Could not find `vtsls` or `ts_ls` LSP client. `vue_ls` will not work!", vim.log.levels.ERROR)
              return
            end

            local ts_client = clients[1]

            local param = unpack(result)
            local id, command, payload = unpack(param)

            ts_client:exec_cmd({
              title = "vue_request_forward",
              command = "typescript.tsserverRequest",
              arguments = { command, payload },
            }, { bufnr = context.bufnr }, function(_, r)
              local response = r and r.body
              local response_data = { { id, response } }
              client:notify("tsserver/response", response_data)
            end)
          end
        end,
        filetypes = { "vue" },
        init_options = {
          vue = { hybridMode = false },
        },
      }

      -- Enable servers
      vim.lsp.config("ts_ls", ts_ls_config)
      vim.lsp.config("vue_ls", vue_ls_config)
      vim.lsp.enable({ "ts_ls", "vue_ls" })

      vim.lsp.config("cssls", {
        filetypes = { "vue", "html", "css" },
      })
      vim.lsp.config("laravel_ls", {
        cmd = { "laravel-ls" },
        filetypes = { "php", "blade" },
        root_dir = function(bufnr)
          return vim.fs.root(bufnr, { "artisan", ".git", "composer.json" })
        end,
      })

      vim.lsp.config("emmet_ls", {
        cmd = { "emmet-ls", "--stdio" },
        filetypes = { "php", "html", "vue", "javascript", "typescript", "blade" },
      })
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostic = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })
      -- Setup other LSP servers
      local servers = {
        "lua_ls",
        "pyright",
        "gopls",
        "html",
        "tailwindcss",
        "bashls",
        "jsonls",
        "marksman",
        "emmet_ls",
        "cssls",
        "laravel_ls",
        "clangd",
        "texlab",
        "kotlin-language-server",
        "csharp_ls",
        "java",
        "sql",
      }
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end
    end,
  },
}
