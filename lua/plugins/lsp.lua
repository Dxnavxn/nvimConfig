return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'SmiteshP/nvim-navic', 
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local navic = require('nvim-navic')
      navic.setup({})
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end

        -- Standard Keybindings
        local opts = { buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>f', function() 
          vim.lsp.buf.format({ async = true }) 
        end, opts)
      end

      local servers = { 'pyright', 'html', 'cssls', 'ts_ls' }
      
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = server == 'pyright' and {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'workspace',
              }
            }
          } or nil
        })
        vim.lsp.enable(server)
      end

      -- Diagnostic Display
      vim.diagnostic.config({
        virtual_text = { prefix = '●' },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = 'rounded' },
      })
    end,
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      
      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end,
  },
}
