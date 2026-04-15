return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      window = {
        width = 30,
        position = "left",
      },
      filesystem = {
        filtered_items = {
          visible = true, -- Shows hidden files (dotfiles)
          hide_dotfiles = false,
        },
        follow_current_file = {
          enabled = true,
        },
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)
    end,
  }
}
