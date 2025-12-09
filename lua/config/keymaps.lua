vim.g.mapleader = " "

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- Open terminal in split
vim.keymap.set("n", "<leader>t", ":vsplit | terminal<CR>", { desc = "Open terminal" })
-- Exit terminal mode with jk
vim.keymap.set("t", "<leader>jk", [[<C-\><C-n>]], { noremap = true, silent = true })

-- Mini picker keybindings (no require needed!)
--vim.keymap.set('n', '<leader>f', '<cmd>Pick files<cr>', { desc = 'Find files' })

--vim.keymap.set('n', '<leader>fg', '<cmd>Pick grep_live<cr>', { desc = 'Live grep' })
--vim.keymap.set('n', '<leader>fb', '<cmd>Pick buffers<cr>', { desc = 'Find buffers' })
--vim.keymap.set('n', '<leader>h', '<cmd>Pick help<cr>', { desc = 'Find help' })
-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
-- Window splits
--vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
--vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
--vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
--vim.keymap.set('n', '<leader>sx', '<cmd>close<cr>', { desc = 'Close current split' })
--
-- Window resizing
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Decrease window width" })
