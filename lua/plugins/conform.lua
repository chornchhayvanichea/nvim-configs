return {
  --formatter
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          json = { "prettierd" },
          jsonc = { "prettierd" },
          python = { "black" },
          php = { "pint" },
          vue = { "prettierd" },
          typescript = { "prettierd" },
          javascript = { "prettierd" },
          html = { "prettierd" },
          markdown = { "prettierd" },
          c = { "clang-format" },
          cpp = { "clang-format" },
          blade = { "blade-formatter" },
          tex = { "latexindent" },
          kotlin = { "ktlint" },
          cs = { "csharpier" },
          go = { "gofumpt" },
          java = { "google-java-format" },
          sql = { "sqruff" },
          rust = { "rustfmt" },
        },
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      })
    end,
  },
}
