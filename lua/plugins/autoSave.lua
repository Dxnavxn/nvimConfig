return {
  "pocco81/auto-save.nvim",
  config = function()
    local autosave = require("auto-save")
    local state = { enabled = false }

    local function show_status()
      vim.api.nvim_echo({{
        "AutoSave: " .. (state.enabled and "ON" or "OFF"),
        "Question",
      }}, true, {})
    end

    autosave.setup({
      enabled = false, 
      execution_message = {
        message = function() -- message to print on save
          return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = {"InsertLeave", "TextChanged"}, -- save when leaving insert mode or changing text
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")
        if fn.getbufvar(buf, "&modifiable") == 1 and
            utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
          return true 
        end
        return false 
      end,
      write_all_buffers = false, -- write all buffers when the current one meets `condition`
      debounce_delay = 135, -- saves the file at most every 135 milliseconds
    })

    vim.keymap.set("n", "<leader>as", function()
      if state.enabled then
        autosave.off()
      else
        autosave.on()
      end
      state.enabled = not state.enabled
      show_status()
    end, { desc = "Toggle AutoSave" })
  end,
}
