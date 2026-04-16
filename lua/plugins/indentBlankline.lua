return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function(_, opts)
    -- Define highlights first
    vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#898989" }) -- Lighter grey
    vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#005FFF" }) -- Blue accent

    require("ibl").setup({
      -- Theme to match midnight ice: subtle grey lines
      indent = {
        char = "│",
        highlight = "IndentBlanklineChar",
      },
      scope = {
        enabled = true,
        highlight = "IndentBlanklineContextChar",
      },
    })
  end,
}