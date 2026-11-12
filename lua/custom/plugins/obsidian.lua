return {
    -- https://github.com/obsidian-nvim/obsidian.nvim
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        lazy = true,
        ft = "markdown",
        cmd = "Obsidian",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            legacy_commands = false,
            workspaces = {
                {
                    name = "Work",
                    path = "C:\\Repos\\obsidian-work-notes",
                },
            },
            templates = {
                folder = "templates",
            },
            daily_notes = {
                folder = "Daily Notes",
                date_format = "YYYY-MM-DD",
                template = "Daily Note Template.md",
            },
            ui = {
                enable = false,
            },
            footer = {
                enabled = false,
            },
            checkbox = {
                order = { " ", "x" },
            },
            note_id_func = function(title)
                return title
            end,
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            checkbox = {
                checked = {
                    icon = "☑",
                    highlight = "RenderMarkdownChecked",
                },
            },
        },
    },
}
