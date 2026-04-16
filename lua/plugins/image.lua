return {
  "3rd/image.nvim",
  config = function()
    require('image').setup({
      backend = "kitty",  -- or "ueberzug" depending on your terminal
      integrations = {
        markdown = {
          enabled = false,  -- Disable inline rendering on hover
        },
      },
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }
    })

    -- Open images in new tabs
    vim.api.nvim_create_autocmd("BufReadPre", {
      pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
      callback = function()
        vim.cmd("tabnew %")
      end,
    })
  end,
}