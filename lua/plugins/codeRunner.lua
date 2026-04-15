return {
  -- THE ENGINE
  {
    "CRAG666/betterTerm.nvim",
    opts = {
      position = "botright",
      size = 15,
      startInserted = true, -- Auto-enter insert mode
    },
  },

  -- THE DRIVER
  {
    "CRAG666/code_runner.nvim",
    dependencies = { "CRAG666/betterTerm.nvim" },
    config = function()
      require("code_runner").setup({
        mode = "better_term", -- CRITICAL: Links the two plugins
        focus = true,
        startinsert = true,
        better_term = {
          clean = true, -- Clears terminal before each run
          number = nil,
        },
        filetype = {
          python = "python3 -u",
          javascript = "node",
          java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
          c = "gcc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
          rust = "cargo run",
        },
      })

      -- KEYMAPS
      local map = vim.keymap.set
      -- Save and Run (VS Code style)
      map('n', '<leader>r', function()
        vim.cmd("write")
        vim.cmd("RunCode")
      end, { desc = "Save and Run Code" })

      -- Toggle the terminal manually (VS Code style Ctrl + `)
      map({ "n", "t" }, "<C-t>", function()
        require("better-term").toggle()
      end, { desc = "Toggle Terminal" })
    end,
  },
}
