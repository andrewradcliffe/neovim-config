-- https://github.com/catppuccin/nvim
return {
    "catppuccin/nvim",
    commit = "cb5665990a797b102715188e73c44c3931b3b42e",
    -- enabled = false,
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    opts = {
        flavour = "mocha",
        transparent_background = false,
        -- color_overrides = {
        --     mocha = {
        --         base = '#000000',
        --         mantle = '#000000',
        --         crust = '#000000',
        --     },
        -- },
        integrations = {
            aerial = true,
            alpha = true,
            cmp = true,
            dashboard = true,
            fidget = true,
            flash = true,
            gitsigns = true,
            headlines = true,
            illuminate = true,
            indent_blankline = { enabled = true },
            leap = true,
            lsp_trouble = true,
            mason = true,
            markdown = true,
            mini = true,
            native_lsp = {
                enabled = true,
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
            },
            navic = { enabled = true, custom_bg = "none" },
            neotest = true,
            neotree = true,
            noice = true,
            notify = true,
            semantic_tokens = true,
            telescope = {
                enabled = true,
                style = "nvchad",
            },
            treesitter = true,
            treesitter_context = false,
            which_key = true,
        },
        custom_highlights = function(colors)
            return {
                LineNrAbove = { fg = "#6c7086", bold = true },
                LineNr = { fg = "#cdd6f4", bold = true },
                LineNrBelow = { fg = "#6c7086", bold = true },
                FloatBorder = { fg = "white", bg = "none" },
                AlphaHeader = { fg = colors.pink, bg = "none" },
                NotifyBackground = { fg = colors.none or "#00000000" },
                TreesitterContextLineNumber = { fg = "#6c7086", bold = true },
                -- DiagnosticUnderlineError = { underline = true, sp = "Red" },
                -- DiagnosticUnderlineWarn = { underline = true, sp = "Yellow" },
                -- DiagnosticUnderlineInfo = { underline = true, sp = "Blue" },
                -- DiagnosticUnderlineHint = { underline = true, sp = "Cyan" },
            }
        end,
    },
    config = function(_, opts)
        -- local env = vim.fn.environ()
        -- local term_program = (env.TERM_PROGRAM or ''):lower()
        --
        -- local transparent = true
        -- if term_program:find 'wezterm' then
        --     transparent = false
        -- end
        --
        -- opts.transparent_background = transparent

        vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { underline = true, sp = "#F28FAD" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { underline = true, sp = "#FAE3B0" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { underline = true, sp = "#89DCEB" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { underline = true, sp = "#B5E8E0" })

        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
