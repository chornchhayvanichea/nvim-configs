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

   -- Explicitly configure vtsls (more reliable than ts_ls)
   vim.lsp.config("vtsls", {
    cmd = { "vtsls", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
   })

   -- Configure vue_ls after vtsls
   vim.lsp.config("vue_ls", {
    cmd = { "vue-language-server", "--stdio" },
    filetypes = { "vue" },
    root_markers = { "package.json", ".git" },
    init_options = {
     typescript = {
      tsdk = "",
     },
    },
   })

   vim.lsp.config("laravel_ls", {
    cmd = { "laravel-ls" }, -- Or the absolute path to your laravel-ls executable
    filetypes = { "php", "blade" },
    root_dir = require("lspconfig.util").root_pattern("artisan", ".git", "composer.json"),
   })

   vim.lsp.config("intelephense", {
    filetypes = { "php", "blade", "html" },
   })
   vim.lsp.config("emmet_ls", {
    cmd = { "emmet_ls" },
    filetypes = {
     "php",
     "html",
     "vue",
     "javascript",
     "typescript",
     "blade",
    },
   })

   -- Enable vtsls first
   vim.lsp.enable("vtsls")

   -- Setup other LSP servers
   local servers = {
    "ts_ls",
    "lua_ls",
    "ruff",
    "gopls",
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

   vim.lsp.enable("laravel_ls")
   -- Enable vue_ls last
   vim.lsp.enable("vue_ls")
  end,
 },
}
