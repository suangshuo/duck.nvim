local config=require("duck.config")
local core=require("duck.do")
local conf=config.config

local config_if=function()
    if(conf.tools.cta)then
        core.ch_to_ascii()
    end
    if(conf.tools.compute)then
        core.compute()
    end
    if(conf.tools.autosave)then
        core.autosave()
    end
    if(conf.tools.lastplace)then
        core.lastplace()
    end
end
local  setup=function(new_config)
    conf = vim.tbl_deep_extend("force", conf, new_config or {})
    core.todo()
    config_if();
end

return {
    setup = setup,
}
