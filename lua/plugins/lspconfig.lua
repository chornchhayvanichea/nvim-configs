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
        virtual_text = true, -- show errors inline
        signs = true, -- show errors in gutter
        underline = true, -- underline errors
        update_in_insert = false, -- don’t update while typing
        severity_sort = true,
      })
      -- Setup LSP servers using vim.lsp.config
      local servers = {
        "lua_ls",
        "ruff",
        "gopls",
        "ts_ls",
        "html",
        "tailwindcss",
        "intelephense",
        "bashls",
        "jsonls",
        "marksman",
        "emmet_ls",
      }

      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end
    end,
  },
}
