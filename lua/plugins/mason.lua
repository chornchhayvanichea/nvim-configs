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
 },
 {
  "williamboman/mason-lspconfig.nvim",
  config = function()
   require("mason-lspconfig").setup({
    ensure_installed = {
     "lua_ls",
     "ts_ls",
    },
   })
  end,
 },
}
