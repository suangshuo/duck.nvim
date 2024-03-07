local api=vim.api
local notify=vim.notify
local todo=function()
    notify("Duck is running!")
end
local ch_to_ascii=function()
    api.nvim_create_user_command(
        'A',
        function(opts)
            notify(tostring(string.byte(opts.args)))
        end,
        { nargs = 1 }
    )
end
local compute=function()
    api.nvim_create_user_command(
        'Compute',
        function(opts)
            local handle=io.popen([[echo "]]..opts.args..[["|bc]])
            local ret=handle:read("*a")
            handle:close()
            notify(ret)
        end,
	{nargs=1}
    )
end
local autosave=function()
    vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
        pattern = { "*" },
        function()
            vim.cmd[[silent! wall]]
            notify("already save")
        end,
        nested = true,
    })
end
local lastplace=function()
    vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "*",
        callback = function()
            if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
                vim.fn.setpos(".", vim.fn.getpos("'\""))
                vim.cmd("silent! foldopen")
            end
        end,
    })
end
return {
    todo = todo,
    ch_to_ascii = ch_to_ascii,
    compute = compute,
    autosave = autosave,
    lastplace = lastplace,
}
