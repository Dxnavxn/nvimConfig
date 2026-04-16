-- BrowserSync :Live Command 
vim.opt.backupcopy = "yes"

vim.api.nvim_create_user_command('Live', function()
    -- Get the current file path (e.g., index.html)
    local current_file = vim.fn.expand("%")

    local bs_cmd = string.format(
        "browser-sync start --server --files '%s' --startPath '%s' --no-notify --reload-delay 500 --no-open", 
        current_file, 
        current_file
    )
    
    vim.fn.jobstart(bs_cmd, {detach = true})
    
    vim.defer_fn(function()
        local url = string.format("http://localhost:3000/%s", current_file)
        vim.fn.jobstart(string.format("google-chrome-stable %s &", url), {detach = true})
    end, 1000)
    
    print("Live Server Active for: " .. current_file)
end, {})

vim.api.nvim_create_user_command('Kill', function()
    vim.fn.jobstart("pkill browser-sync")
    print("BrowserSync Stopped")
end, {})
