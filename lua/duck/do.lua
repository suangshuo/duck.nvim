local api=vim.api
local notify=vim.notify
local vc=vim.cmd
local vf=vim.fn

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
    api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
        pattern = { "*" },
        callback=function()
            vc[[silent! wall]]
            notify("already save")
        end,
        nested = true,
    })
end
local lastplace=function()
    api.nvim_create_autocmd("BufReadPost", {
        pattern = "*",
        callback = function()
            if vf.line("'\"") > 0 and vf.line("'\"") <= vf.line("$") then
                vf.setpos(".", vf.getpos("'\""))
                vc("silent! foldopen")
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
