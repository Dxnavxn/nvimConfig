return {
  "nvim-treesitter/nvim-treesitter-context",
  config = function()
    require('treesitter-context').setup({
      max_lines = 1,  -- Show only one line of context
    })

    -- Set highlights for context bar
    local hl = vim.api.nvim_set_hl
    hl(0, 'TreesitterContext', { bg = '#222222', fg = '#ffffff' })
    hl(0, 'TreesitterContextLineNumber', { bg = '#222222', fg = '#888888' })
    hl(0, 'TreesitterContextBottom', { underline = true, sp = '#444444' })
  end,
}