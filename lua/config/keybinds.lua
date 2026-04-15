vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- NeoTree Keybinds
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = "Toggle Explorer" })
vim.keymap.set('n', '<leader>o', '<cmd>Neotree focus<cr>', { desc = 'Focus Explorer' })

vim.keymap.set('n', '<C-h>', '<C-w>h') -- Ctrl+h moves left
vim.keymap.set('n', '<C-j>', '<C-w>j') -- Ctrl+j moves down
vim.keymap.set('n', '<C-k>', '<C-w>k') -- Ctrl+k moves up
vim.keymap.set('n', '<C-l>', '<C-w>l') -- Ctrl+l moves right

