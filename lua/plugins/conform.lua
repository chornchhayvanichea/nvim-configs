return {
 --formatter
 {
  "stevearc/conform.nvim",
  config = function()
   require("conform").setup({
    formatters_by_ft = {
     lua = { "stylua" },
     python = { "ruff" },
     php = { "pint" },
     vue = { "prettierd" },
     typescript = { "prettierd" },
     javascript = { "prettierd" },
     html = { "prettierd" },
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
