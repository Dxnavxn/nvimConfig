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

-- Window management
vim.keymap.set('n', '<C-w>r', '<C-w>r') -- Rotate windows downwards/rightwards
vim.keymap.set('n', '<C-w>R', '<C-w>R') -- Rotate windows upwards/leftwards
vim.keymap.set('n', '<C-w>x', '<C-w>x') -- Exchange current window with next
vim.keymap.set('n', '<leader>wh', '<C-w>H') -- Move window to far left
vim.keymap.set('n', '<leader>wj', '<C-w>J') -- Move window to bottom
vim.keymap.set('n', '<leader>wk', '<C-w>K') -- Move window to top
vim.keymap.set('n', '<leader>wl', '<C-w>L') -- Move window to far right

-- Tab management (for Barbar tabpages)
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>th', ':tabprevious<CR>', { desc = 'Previous tab' })
vim.keymap.set('n', '<leader>tl', ':tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>t1', ':tabn 1<CR>', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<leader>t2', ':tabn 2<CR>', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<leader>t3', ':tabn 3<CR>', { desc = 'Go to tab 3' })

-- Context plugin
vim.keymap.set('n', '<leader>cx', ':TSContextToggle<CR>', { desc = 'Toggle treesitter context display' })

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

