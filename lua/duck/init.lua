local config=require("duck.config")
local core=require("duck.do")

local  setup=function(new_config)
    config.config = vim.tbl_deep_extend("force", config.config, new_config or {})
end

return {
    setup = setup,
    todo = core.todo()
}
