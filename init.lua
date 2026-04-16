require('config.options')
require('config.keybinds')
require('config.lazy')
require("commands.live")

vim.api.nvim_create_autocmd({
  "WinResized",
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    local status, bbq_ui = pcall(require, "barbecue.ui")
    if status then
      bbq_ui.update()
    end
  end,
})
