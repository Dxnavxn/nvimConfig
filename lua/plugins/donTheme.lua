return {
  {
    name = "dwm-theme",
    dir = vim.fn.stdpath("config"),
    priority = 1000,
    lazy = false,
    config = function()
      local function forceDwmColors()
        local colors = {
          bg            = "#141414", -- Background
          fg            = "#F2F2F2", -- Regular Text 
          uiAccent      = "#005FFF", 
          lineHigh      = "#1c1c1c", -- Highlight
          
          syntaxMain    = "#1C39BB", -- Keywords
          syntaxVar     = "#FFFFFF", -- Variables
          syntaxType    = "#4682B4", -- Types
          syntaxFunc    = "#004B93", -- Functions
          syntaxStr     = "#A5D6FF", -- Strings
          syntaxConst   = "#5F72A5", -- Booleans/Numbers
          syntaxSym     = "#4A5568", -- Symbols
        }

        local hl = vim.api.nvim_set_hl

        -- 1. Base UI
        hl(0, "Normal", { fg = colors.fg, bg = colors.bg, force = true })
        hl(0, "NormalFloat", { fg = colors.fg, bg = colors.bg, force = true })
        hl(0, "EndOfBuffer", { fg = colors.bg, bg = colors.bg, force = true })

        -- 2. Directory & Explorer
        hl(0, "Directory", { fg = colors.uiAccent, bold = true, force = true })
        hl(0, "NeoTreeDirectoryName", { fg = "#FFFFFF", force = true }) 
        hl(0, "NeoTreeDirectoryIcon", { fg = colors.uiAccent, force = true })
        hl(0, "NeoTreeRootName", { fg = colors.uiAccent, bold = true, force = true })
        hl(0, "NeoTreeGitUntracked", { fg = "#94fd00", italic = true, force = true })
        hl(0, "NeoTreeGitAdded", { fg = "#FFFFFF", force = true })
        hl(0, "NeoTreeGitModified", { fg = "#2765f6", force = true })

        -- Keywords
        local toMain = { "Keyword", "Statement", "PreProc", "Define", "Include", "@keyword", "@storageclass", "@module", "@variable.builtin" }
        for _, group in ipairs(toMain) do hl(0, group, { fg = colors.syntaxMain, bold = true, force = true }) end

        -- Variables
        local toVar = { "Identifier", "Variable", "Property", "Parameter", "Member", "@variable", "@property", "@parameter", "@member", "@field", "@variable.member" }
        for _, group in ipairs(toVar) do hl(0, group, { fg = colors.syntaxVar, force = true }) end

        -- Types
        hl(0, "Type", { fg = colors.syntaxType, bold = true, force = true })
        hl(0, "@type", { fg = colors.syntaxType, bold = true, force = true })

        -- Functions
        local toFunc = { "Function", "@function", "@method", "@function.builtin", "@constructor" }
        for _, group in ipairs(toFunc) do hl(0, group, { fg = colors.syntaxFunc, bold = true, force = true }) end

        -- Booleans & Numbers
        local toConst = { "Boolean", "Number", "Constant", "Float", "@boolean", "@number", "@constant", "@float" }
        for _, group in ipairs(toConst) do hl(0, group, { fg = colors.syntaxConst, bold = true, force = true }) end

        -- Symbols
        local toSym = { "Delimiter", "Operator", "@punctuation.bracket", "@punctuation.delimiter", "@operator" }
        for _, group in ipairs(toSym) do hl(0, group, { fg = colors.syntaxSym, force = true }) end

        -- Strings & Comments
        hl(0, "String", { fg = colors.syntaxStr, force = true })
        hl(0, "@string", { fg = colors.syntaxStr, force = true })
        hl(0, "Comment", { fg = "#333A45", italic = true, force = true })

        -- Cursorline & Gutter
        hl(0, "CursorLine", { bg = colors.lineHigh, force = true })
        hl(0, "CursorLineNr", { fg = colors.uiAccent, bg = colors.lineHigh, bold = true, force = true })
        hl(0, "LineNr", { fg = colors.fg, bg = colors.bg, force = true })
        vim.opt.cursorline = true


      end

      forceDwmColors()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = forceDwmColors })
      vim.defer_fn(forceDwmColors, 100)
      vim.g.colors_name = "midnight_ice_dwm"
    end,
  },
  { -- luaLine
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualineColors = {
        accent  = '#005FFF',
        bg      = '#141414',
        text    = '#EEEEEE',
        gutter  = '#1c1c1c',
        visual  = '#A5D6FF',
      }
      require('lualine').setup({
        options = {
          theme = {
            normal = {
              a = { fg = lualineColors.bg, bg = lualineColors.accent, gui = 'bold' },
              b = { fg = lualineColors.text, bg = lualineColors.gutter },
              c = { fg = lualineColors.text, bg = lualineColors.bg },
            },
            insert = { a = { fg = lualineColors.bg, bg = lualineColors.text, gui = 'bold' } },
            visual = { a = { fg = lualineColors.bg, bg = lualineColors.visual, gui = 'bold' } },
          },
          globalstatus = true,
          component_separators = '',
          section_separators = { left = '', right = '' }, 
        },
        sections = {
          lualine_a = { 
            { 'mode', separator = { right = '' }, padding = { left = 1, right = 0 } } 
          },
          lualine_b = { 'branch', 'diagnostics' },
          lualine_c = { 
            { 'filename', color = { fg = lualineColors.text, gui = 'bold' } },
            { function() return "%=" end } 
          },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 
            { 'location', separator = { left = '' }, padding = { left = 0, right = 1 } } 
          }
        }
      })
    end
  }
}
