-- Colorscheme setup
return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,  -- load immediately
        priority = 1000,
        config = function()
            vim.cmd("colorscheme gruvbox-material")
            vim.o.background = "dark"
        end,
    },
}
