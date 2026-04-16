return {
  "romgrk/barbar.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("barbar").setup({
    })

    -- Set highlights to match midnight ice theme
    local hl = vim.api.nvim_set_hl
    hl(0, 'BufferCurrent', { fg = '#FFFFFF', bg = '#141414', bold = true })
    hl(0, 'BufferCurrentIcon', { fg = '#005FFF', bg = '#141414' })
    hl(0, 'BufferCurrentMod', { fg = '#FF0055', bg = '#141414' })
    hl(0, 'BufferCurrentSign', { fg = '#005FFF', bg = '#141414' })

    hl(0, 'BufferVisible', { fg = '#FFFFFF', bg = '#1c1c1c' })
    hl(0, 'BufferVisibleIcon', { fg = '#4A5568', bg = '#1c1c1c' })
    hl(0, 'BufferVisibleMod', { fg = '#FF0055', bg = '#1c1c1c' })
    hl(0, 'BufferVisibleSign', { fg = '#005FFF', bg = '#1c1c1c' })

    hl(0, 'BufferInactive', { fg = '#333A45', bg = '#141414' })
    hl(0, 'BufferInactiveIcon', { fg = '#333A45', bg = '#141414' })
    hl(0, 'BufferInactiveMod', { fg = '#FF0055', bg = '#141414' })
    hl(0, 'BufferInactiveSign', { fg = '#4A5568', bg = '#141414' })

    hl(0, 'BufferTabpageFill', { bg = '#141414' })
    hl(0, 'BufferTabpages', { fg = '#FFFFFF', bg = '#141414' })
    hl(0, 'BufferTabpagesSep', { fg = '#333A45', bg = '#141414' })
  end,
}
