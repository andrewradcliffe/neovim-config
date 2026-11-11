return {
    {
        'tpope/vim-dadbod',
        lazy = true,
    },
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            'tpope/vim-dadbod',
            'kristijanhusak/vim-dadbod-completion',
        },
        cmd = { 'DBUI', 'DBUIToggle', 'DBUIClose', 'DBUIAddConnection', 'DBUIFindBuffer', 'DBUIRenameBuffer', 'DBUILastQueryInfo' },
        keys = {
            { '<leader>db', '<cmd>DBUIToggle<CR>',        desc = '[D]ata[b]ase UI toggle' },
            { '<leader>do', '<cmd>DBUI<CR>',              desc = '[D]atabase UI [o]pen' },
            { '<leader>dx', '<cmd>DBUIClose<CR>',         desc = '[D]atabase UI close [x]' },
            { '<leader>da', '<cmd>DBUIAddConnection<CR>', desc = '[D]atabase [a]dd connection' },
            { '<leader>df', '<cmd>DBUIFindBuffer<CR>',    desc = '[D]atabase [f]ind buffer' },
            { '<leader>dr', '<cmd>DBUIRenameBuffer<CR>',  desc = '[D]atabase [r]ename buffer' },
            { '<leader>di', '<cmd>DBUILastQueryInfo<CR>', desc = '[D]atabase last query [i]nfo' },
            { '<leader>de', '<cmd>DB<CR>',                desc = '[D]atabase [e]xecute', mode = 'n' },
            { '<leader>de', ':DB<CR>',                    desc = '[D]atabase [e]xecute selection', mode = 'v' },
        },
        init = function()
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.db_ui_save_location = vim.fn.stdpath 'data' .. '/db_ui'
        end,
    },
    {
        'kristijanhusak/vim-dadbod-completion',
        dependencies = { 'tpope/vim-dadbod' },
        ft = { 'sql', 'mysql', 'plsql' },
        config = function()
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'sql', 'mysql', 'plsql' },
                callback = function()
                    require('cmp').setup.buffer {
                        sources = {
                            { name = 'vim-dadbod-completion' },
                            { name = 'buffer' },
                        },
                    }
                end,
            })
        end,
    },
}
