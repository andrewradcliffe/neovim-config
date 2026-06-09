return {
    { -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
        -- NOTE: nvim-treesitter v1.x (main branch) dropped the old nvim-treesitter.configs API.
        -- Highlighting is now enabled per-filetype via vim.treesitter.start().
        config = function()
            -- MinGW bin dir is missing from PATH on Windows, causing silent gcc compilation failures.
            vim.env.PATH = "C:\\ProgramData\\chocolatey\\lib\\mingw\\tools\\install\\mingw64\\bin;" .. vim.env.PATH

            require("nvim-treesitter").setup()

            -- Install parsers (equivalent to ensure_installed).
            require("nvim-treesitter").install({
                "bash", "c", "diff", "html", "lua", "luadoc",
                "markdown", "markdown_inline", "query", "vim", "vimdoc",
            })

            -- Enable treesitter highlighting for all filetypes.
            -- Ruby is excluded: it depends on vim's regex highlighting for correct indent rules.
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    if args.match ~= "ruby" then
                        pcall(vim.treesitter.start)
                    end
                end,
            })
        end,
        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter" },
        -- config = function()
        --     require("nvim-treesitter.configs").setup({
        --         textobjects = {
        --             select = {
        --                 enable = true,
        --
        --                 -- Automatically jump forward to textobj, similar to targets.vim
        --                 lookahead = true,
        --
        --                 keymaps = {
        --                     -- You can use the capture groups defined in textobjects.scm
        --                     ["af"] = "@function.outer",
        --                     ["if"] = "@function.inner",
        --                     ["ac"] = "@class.outer",
        --                     -- You can optionally set descriptions to the mappings (used in the desc parameter of
        --                     -- nvim_buf_set_keymap) which plugins like which-key display
        --                     ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        --                     -- You can also use captures from other query groups like `locals.scm`
        --                     ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
        --                 },
        --                 -- You can choose the select mode (default is charwise 'v')
        --                 --
        --                 -- Can also be a function which gets passed a table with the keys
        --                 -- * query_string: eg '@function.inner'
        --                 -- * method: eg 'v' or 'o'
        --                 -- and should return the mode ('v', 'V', or '<c-v>') or a table
        --                 -- mapping query_strings to modes.
        --                 selection_modes = {
        --                     ["@parameter.outer"] = "v", -- charwise
        --                     ["@function.outer"] = "V", -- linewise
        --                     ["@class.outer"] = "<c-v>", -- blockwise
        --                 },
        --                 -- If you set this to `true` (default is `false`) then any textobject is
        --                 -- extended to include preceding or succeeding whitespace. Succeeding
        --                 -- whitespace has priority in order to act similarly to eg the built-in
        --                 -- `ap`.
        --                 --
        --                 -- Can also be a function which gets passed a table with the keys
        --                 -- * query_string: eg '@function.inner'
        --                 -- * selection_mode: eg 'v'
        --                 -- and should return true or false
        --                 include_surrounding_whitespace = true,
        --             },
        --             swap = {
        --                 enable = true,
        --                 swap_next = {
        --                     ["<leader>a"] = "@parameter.inner",
        --                 },
        --                 swap_previous = {
        --                     ["<leader>A"] = "@parameter.inner",
        --                 },
        --             },
        --             move = {
        --                 enable = true,
        --                 set_jumps = true,
        --                 goto_next_start = {
        --                     ["[f"] = "@function.outer",
        --                     ["]["] = "@class.outer",
        --                 },
        --                 goto_previous_start = {
        --                     ["]f"] = "@function.outer",
        --                     ["[["] = "@class.outer"
        --                 },
        --                 goto_previous_end = {
        --                     ["[F"] = "@function.outer",
        --                     ["[]"] = "@class.outer"
        --                 }
        --             }
        --         }
        --     })
        -- end,
    },
}
