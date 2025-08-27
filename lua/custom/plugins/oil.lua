return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        default_file_explorer = true,
        delete_to_trash = false,
        -- skip_confirm_for_simple_edits = true,
        view_options = {
            show_hidden = true,
            natural_order = "fast",
            win_options = {
                wrap = true,
            },
        },
        columns = {
            "icon",
            -- "permissions",
            -- "size",
            -- "mtime",
        },
        keymaps = {
            ["<C-s>"] = { nil },
            ["<C-h>"] = { nil },
            ["<C-l>"] = { nil },
            ["<C-v>"] = { "actions.select", opts = { vertical = true } },
            ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
            ["<C-r>"] = "actions.refresh",
        },
    },
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
}
