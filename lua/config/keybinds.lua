vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- NeoTree Keybinds
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = "Toggle Explorer" })
vim.keymap.set('n', '<leader>o', '<cmd>Neotree focus<cr>', { desc = 'Focus Explorer' })

-- Movement Keybinds
vim.keymap.set('n', '<C-h>', '<C-w>h') --  move left
vim.keymap.set('n', '<C-j>', '<C-w>j') --  move down
vim.keymap.set('n', '<C-k>', '<C-w>k') --  move up
vim.keymap.set('n', '<C-l>', '<C-w>l') --  move right

-- Barbar bufferline navigation
vim.keymap.set('n', '<leader>bn', '<cmd>BufferNext<CR>', { desc = 'Barbar: next buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>BufferPrevious<CR>', { desc = 'Barbar: previous buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>BufferClose<CR>', { desc = 'Barbar: close buffer' })
vim.keymap.set('n', '<leader>bb', '<cmd>BufferPick<CR>', { desc = 'Barbar: pick buffer' })

-- Exit Terminal Mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {noremap = true})

-- Kill the current terminal window/buffer immediately
vim.keymap.set({"n", "t"}, "<leader>tk", function()
  -- Check if the current buffer is a terminal
  if vim.bo.buftype == "terminal" then
    vim.cmd("bd!") -- Force delete the buffer
  else
    pcall(function() require("betterTerm").close() end)
  end
end, { desc = "Kill current terminal buffer" })

