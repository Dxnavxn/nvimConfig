-- plugins/gitSigns.lua
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gitsigns.next_hunk() end)
        return '<Ignore>'
      end, { expr = true, desc = "Next Hunk" })

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gitsigns.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true, desc = "Prev Hunk" })

      -- Actions
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "Stage Hunk" })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "Reset Hunk" })
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "Preview Hunk" })
      map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end, { desc = "Blame Line" })
      map('n', '<leader>td', gitsigns.toggle_deleted, { desc = "Toggle Deleted" })

      -- Define your custom colors here
      vim.api.nvim_set_hl(0, 'GitSignsAdd',    { fg = '#00FF00', bold = true }) -- Neon Greenvim
      vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#00FFFF', bold = true }) -- Electric Cyan/Blue
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#FF0055', bold = true }) -- Hot Pink/Red
      vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { fg = '#FFCC00', bold = true }) -- Bright Yellow
   end,
  },
}
