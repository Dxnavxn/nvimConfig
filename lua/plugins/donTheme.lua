return {
  {
    name = "dwm-theme",
    dir = vim.fn.stdpath("config"),
    priority = 1000,
    lazy = false,
    config = function()
      local function forceDwmColors()
        local colors = {
          bg            = "#141414", -- Charcoal Background
          fg            = "#FFFFFF", -- Regular Text (Muted Steel Grey)
          uiAccent      = "#005FFF", -- Deep UI Blue
          lineHigh      = "#1c1c1c",
          
          -- Deep Midnight Spectrum (camelCase)
          syntaxMain    = "#1C39BB", -- Keywords (Deep Cobalt)
          syntaxVar     = "#FFFFFF", -- Variables (Pure White)
          syntaxType    = "#4682B4", -- Types (Steel Blue)
          syntaxFunc    = "#004B93", -- Functions (Midnight Navy)
          syntaxStr     = "#A5D6FF", -- Strings (Soft Ice Blue - No Gold)
          syntaxConst   = "#5F72A5", -- Booleans/Numbers (Dusky Blue)
          syntaxSym     = "#4A5568", -- Symbols (Dark Slate)
        }

        local hl = vim.api.nvim_set_hl

        -- 1. Base UI
        hl(0, "Normal", { fg = colors.fg, bg = colors.bg, force = true })
        hl(0, "NormalFloat", { fg = colors.fg, bg = colors.bg, force = true })
        hl(0, "EndOfBuffer", { fg = colors.bg, bg = colors.bg, force = true })

        -- 2. Directory & Explorer
        hl(0, "Directory", { fg = colors.uiAccent, bold = true, force = true })
        hl(0, "NeoTreeDirectoryName", { fg = colors.uiAccent, force = true })
        hl(0, "NeoTreeDirectoryIcon", { fg = colors.uiAccent, force = true })
        hl(0, "NeoTreeRootName", { fg = colors.uiAccent, bold = true, force = true })

        -- 3. Keywords (syntaxMain)
        local toMain = {
          "Keyword", "Statement", "PreProc", "Define", "Include",
          "@keyword", "@storageclass", "@module", "@variable.builtin"
        }
        for _, group in ipairs(toMain) do
          hl(0, group, { fg = colors.syntaxMain, bold = true, force = true })
        end

        -- 4. Variables (syntaxVar)
        local toVar = {
          "Identifier", "Variable", "Property", "Parameter", "Member",
          "@variable", "@property", "@parameter", "@member", "@field",
          "@variable.member"
        }
        for _, group in ipairs(toVar) do
          hl(0, group, { fg = colors.syntaxVar, force = true })
        end

        -- 5. Types (syntaxType)
        hl(0, "Type", { fg = colors.syntaxType, bold = true, force = true })
        hl(0, "@type", { fg = colors.syntaxType, bold = true, force = true })

        -- 6. Functions (syntaxFunc)
        local toFunc = {
          "Function", "@function", "@method", "@function.builtin", "@constructor"
        }
        for _, group in ipairs(toFunc) do
          hl(0, group, { fg = colors.syntaxFunc, bold = true, force = true })
        end

        -- 7. Booleans & Numbers (syntaxConst)
        local toConst = {
          "Boolean", "Number", "Constant", "Float",
          "@boolean", "@number", "@constant", "@float"
        }
        for _, group in ipairs(toConst) do
          hl(0, group, { fg = colors.syntaxConst, bold = true, force = true })
        end

        -- 8. Symbols & Operators (syntaxSym)
        local toSym = {
          "Delimiter", "Operator", "@punctuation.bracket", "@punctuation.delimiter", "@operator"
        }
        for _, group in ipairs(toSym) do
          hl(0, group, { fg = colors.syntaxSym, force = true })
        end

        -- 9. Strings (syntaxStr) & Comments
        hl(0, "String", { fg = colors.syntaxStr, force = true })
        hl(0, "@string", { fg = colors.syntaxStr, force = true })
        hl(0, "Comment", { fg = "#333A45", italic = true, force = true })

        -- 10. Cursorline & Gutter
        hl(0, "CursorLine", { bg = colors.lineHigh, force = true })
        hl(0, "CursorLineNr", { fg = colors.uiAccent, bg = colors.lineHigh, bold = true, force = true })
        hl(0, "LineNr", { fg = "#2a2a2a", bg = colors.bg, force = true })

        vim.opt.cursorline = true
      end

      forceDwmColors()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = forceDwmColors })
      vim.defer_fn(forceDwmColors, 100)
      vim.g.colors_name = "midnight_ice_dwm"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualineColors = {
        accent  = '#005FFF',
        bg      = '#141414',
        text    = '#EEEEEE',
        gutter  = '#1c1c1c',
        visual  = '#A5D6FF', -- Matches the new Ice Blue string color
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
          section_separators = '',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diagnostics' },
          lualine_c = { { 'filename', color = { fg = lualineColors.text, gui = 'bold' } } },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        }
      })
    end
  }
}
