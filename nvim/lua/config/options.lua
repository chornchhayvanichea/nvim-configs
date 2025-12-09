-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.autoindent = true -- Enable auto indentation
vim.o.smartindent = true -- Enable smart indentation

-- Add to the end of lua/config/options.lua

-- Cursor configuration
vim.opt.guicursor = "a:block,i:block-blinkon150-blinkoff150-Cursor2"

-- Set cursor colors after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Cursor2", { bg = "#bae1ff" })
  end,
})

-- Set initially
vim.api.nvim_set_hl(0, "Cursor2", { bg = "#bae1ff" })
vim.filetype.add({
  extension = {
    conf = "sh", -- treat *.conf as shell
    rc = "sh", -- treat *.rc as shell
  },
})
