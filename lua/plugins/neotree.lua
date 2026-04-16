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
        mappings = {
          -- VERTICAL SPLIT
          ["v"] = "open_vsplit",
          -- HORIZONTAL SPLIT
          ["s"] = "open_split",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true, 
          hide_dotfiles = false,
        },
        follow_current_file = {
          enabled = true,
        },
      },
    },
    config = function(_, opts)
      require("nvim-web-devicons").setup({ default = true })

      require("neo-tree").setup(vim.tbl_deep_extend("force", {
        default_component_configs = {
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰷱",
            folder_empty_open = "󰷱",
            default = "",
          },
        },
      }, opts or {}))
    end,
  }
}
