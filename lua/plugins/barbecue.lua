return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    attach_navic = true,
    create_autocmd = false,

    modifiers = {
      dirname = ":p:~",
    },
    
    show_dirname = true,
    show_basename = true,
    symbols = {
      depth = 0,
    },
    
    theme = {
      normal = { fg = "#FFFFFF", bg = "#141414" },
      dirname = { fg = "#4A5568" },
      basename = { fg = "#FFFFFF", bold = true },
      context = { fg = "#005FFF" }, -- Blue accent for LSP symbols
      separator = { fg = "#333A45" },
    },
  },
  config = function(_, opts)
    require("barbecue").setup(opts)
  end,
}
