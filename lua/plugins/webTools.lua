return {
  "ray-x/web-tools.nvim",
  config = function()
    require('web-tools').setup({
      keymaps = {
        rename = nil, 
        repeat_rename = '.',
      },
      hurl = {
        show_headers = false, -- do not show http headers
        floating = false,      -- use floating windows
        json5 = false,        -- use json5 parser
        formatters = {        -- format the result by filetype
          json = { 'jq' },
          html = { 'prettier', '--parser', 'html' },
        },
      },
    })
  end,
}
