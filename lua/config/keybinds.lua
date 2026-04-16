vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex) -- (<leader>cd | Open Ex command)

-- NeoTree Keybinds
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = "Toggle Explorer" }) -- (<leader>e | Toggle Explorer)
vim.keymap.set('n', '<leader>o', '<cmd>Neotree focus<cr>', { desc = 'Focus Explorer' }) -- (<leader>o | Focus Explorer)

-- Movement Keybinds
vim.keymap.set('n', '<C-h>', '<C-w>h') -- (<C-h> | Move left)
vim.keymap.set('n', '<C-j>', '<C-w>j') -- (<C-j> | Move down)
vim.keymap.set('n', '<C-k>', '<C-w>k') -- (<C-k> | Move up)
vim.keymap.set('n', '<C-l>', '<C-w>l') -- (<C-l> | Move right)

-- Barbar bufferline navigation
vim.keymap.set('n', '<leader>bn', '<cmd>BufferNext<CR>', { desc = 'Barbar: next buffer' }) -- (<leader>bn | Next buffer)
vim.keymap.set('n', '<leader>bp', '<cmd>BufferPrevious<CR>', { desc = 'Barbar: previous buffer' }) -- (<leader>bp | Previous buffer)
vim.keymap.set('n', '<leader>bd', '<cmd>BufferClose<CR>', { desc = 'Barbar: close buffer' }) -- (<leader>bd | Close buffer)
vim.keymap.set('n', '<leader>bb', '<cmd>BufferPick<CR>', { desc = 'Barbar: pick buffer' }) -- (<leader>bb | Pick buffer)
vim.keymap.set('n', '<leader>bm', '<cmd>BufferMoveNext<CR>', { desc = 'Barbar: move buffer right' }) -- (<leader>bm | Move buffer right)
vim.keymap.set('n', '<leader>bM', '<cmd>BufferMovePrevious<CR>', { desc = 'Barbar: move buffer left' }) -- (<leader>bM | Move buffer left)

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {noremap = true}) -- (<Esc> | Exit terminal mode)

-- Kill the current terminal window/buffer immediately
vim.keymap.set({"n", "t"}, "<leader>tk", function()
  -- Check if the current buffer is a terminal
  if vim.bo.buftype == "terminal" then
    vim.cmd("bd!") -- Force delete the buffer
  else
    pcall(function() require("betterTerm").close() end)
  end
end, { desc = "Kill current terminal buffer" }) -- (<leader>tk | Kill current terminal buffer)

