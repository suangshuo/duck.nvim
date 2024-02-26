local config=require("duck.config")
local core=require("duck.do")

local config_if=function()
    local conf=config.config
    if(conf.tools.cta)then
        core.ch_to_ascii()
    end
end
local  setup=function(new_config)
    config.config = vim.tbl_deep_extend("force", config.config, new_config or {})
    core.todo()
    config_if();
end

return {
    setup = setup,
}
