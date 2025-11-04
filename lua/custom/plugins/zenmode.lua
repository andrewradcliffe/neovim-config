-- https://github.com/folke/zen-mode.nvim
return {
    "folke/zen-mode.nvim",
    enabled = false,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        window = {
            backdrop = 0,
            width = 1,
        },
        plugins = {
            gitsigns = { enabled = true },
            wezterm = { enabled = true },
        },
        on_open = function(win)
            vim.api.nvim_win_set_option(win, "winhighlight", "Normal:ZenBg,NormalNC:ZenBg")
            vim.api.nvim_set_hl(0, "ZenBg", { bg = "#000000" })
        end,
        on_close = function()
            vim.api.nvim_set_hl(0, "ZenBg", {})
        end,
    },
}
