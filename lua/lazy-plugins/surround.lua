-- custom configurations
-- see https://github.com/kylechui/nvim-surround/blob/main/lua/nvim-surround/config.lua
local config = {}

return {
    "kylechui/nvim-surround",
    version = "*",
    config = function ()
        require("nvim-surround").setup(config)
    end
}
