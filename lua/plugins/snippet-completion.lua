return {
  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    version = "*",
    build = "make install_jsregexp",
    config = function()
      local luasnip = require("luasnip")
      -- Load VSCode snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      -- Key mappings for snippet navigation
    end,
  },
  -- Completion engine
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
      keymap = { preset = "default" },
      appearance = { nerd_font_variant = "mono" },
      completion = {
        documentation = { auto_show = true },
        accept = {
          auto_brackets = { enabled = true },
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true },
    },
  },
}
