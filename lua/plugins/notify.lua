local config = {
    -- change the pattern of the ui
    -- "default", "minimal", "simple", "compact"
    render = "compact",
    -- change the animation when the notification disappears
    -- "fade_in_slide_out", "fade", "slide", "static"
    stages = "fade"
}

return {
    "rcarriga/nvim-notify",
    config = function ()
        require("notify").setup(config)
    end
}
