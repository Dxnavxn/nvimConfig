return {
  {
    "CRAG666/betterTerm.nvim",
    opts = {
      position = "botright",
      size = 12, 
      startInserted = true, 
    },
  },

  {
    "CRAG666/code_runner.nvim",
    dependencies = { "CRAG666/betterTerm.nvim" },
    config = function()
      require("code_runner").setup({
        mode = "better_term", 
        focus = true,
        startinsert = true,
        better_term = {
          clean = true, 
          number = 0,
        },
        filetype = {
          python = "python3 -u",
          javascript = "node",
          java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
          c = "gcc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
          rust = "cargo run",
        },
      })

      -- 1. STABLE AUTO-SCROLL
      vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter" }, {
        group = vim.api.nvim_create_augroup("TerminalScroll", { clear = true }),
        callback = function()
          vim.cmd([[highlight Terminal guibg=#080808]])
          local bufnr = vim.api.nvim_get_current_buf()
          local line_count = vim.api.nvim_buf_line_count(bufnr)
          vim.api.nvim_win_set_cursor(0, {line_count, 0})
          vim.cmd("startinsert")
        end,
      })

      -- 2. KEYMAPS
      local map = vim.keymap.set
      map('n', '<leader>r', function()
        vim.cmd("write")
        vim.cmd("RunCode")
      end, { desc = "Save and Run" })

      map({ "n", "t" }, "<C-t>", function()
        require("betterTerm").open()
      end, { desc = "Toggle Terminal" })
      
      map({ "n", "t" }, "<leader>tk", function()
        vim.cmd("bd!")
      end, { desc = "Kill Terminal" })
    end,
  },
}
