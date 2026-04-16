vim.g.terminal_color_0  = "#080808"
vim.g.terminal_color_1  = "#ff0055"
vim.g.terminal_color_2  = "#00ff9d"
vim.g.terminal_color_3  = "#ffcc00"
vim.g.terminal_color_4  = "#00a6fb"
vim.g.terminal_color_5  = "#ff2ebd"
vim.g.terminal_color_6  = "#00f2ff"
vim.g.terminal_color_7  = "#ffffff"

vim.g.terminal_color_8  = "#4d4d4d"
vim.g.terminal_color_9  = "#ff4d88"
vim.g.terminal_color_10 = "#50fa7b"
vim.g.terminal_color_11 = "#fffb00"
vim.g.terminal_color_12 = "#00a6fb"
vim.g.terminal_color_13 = "#ff99e6"
vim.g.terminal_color_14 = "#a3ffff"
vim.g.terminal_color_15 = "#f8f8f2"

return {
  {
    "terminal-theme",
    dir = vim.fn.stdpath("config"),
    lazy = false,
    priority = 1000,
  }
}
