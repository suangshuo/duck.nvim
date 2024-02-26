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
return {
    todo = todo,
    ch_to_ascii =ch_to_ascii,
    compute = compute,
}
