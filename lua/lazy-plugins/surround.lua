-- import surround plugin safely
--[[ local status, surround = pcall(require, "nvim-surround")
if not status then
    return
end ]]

return {
    "kylechui/nvim-surround",
    version = "*",
    config = function ()
        require("nvim-surround").setup({
            -- custom configurations
            -- see https://github.com/kylechui/nvim-surround/blob/main/lua/nvim-surround/config.lua
        })
    end
}
