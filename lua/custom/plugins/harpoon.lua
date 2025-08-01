return {
    'ThePrimeagen/harpoon',
    event = 'VeryLazy',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local harpoon = require 'harpoon'
        harpoon:setup {}

        -- basic telescope configuration
        local conf = require('telescope.config').values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require('telescope.pickers')
                .new({}, {
                    prompt_title = 'Harpoon',
                    finder = require('telescope.finders').new_table {
                        results = file_paths,
                    },
                    previewer = conf.file_previewer {},
                    sorter = conf.generic_sorter {},
                })
                :find()
        end

        -- set keymaps
        vim.keymap.set('n', '<leader>ha', function()
            harpoon:list():add()
        end, { desc = '[A]dd file' })
        vim.keymap.set('n', '<leader>hl', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = 'Toggle [H]arpoon [L]ist' })
        vim.keymap.set('n', '<leader>sh', function()
            toggle_telescope(harpoon:list())
        end, { desc = '[S]earch [H]arpoon buffers' })

        vim.keymap.set('n', '<C-z>', function()
            harpoon:list():select(1)
        end)
        vim.keymap.set('n', '<C-x>', function()
            harpoon:list():select(2)
        end)
        vim.keymap.set('n', '<C-c>', function()
            harpoon:list():select(3)
        end)
        -- vim.keymap.set('n', '<C-f>', function()
        --   harpoon:list():select(4)
        -- end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set('n', '<C-S-P>', function()
            harpoon:list():prev()
        end)
        vim.keymap.set('n', '<C-S-N>', function()
            harpoon:list():next()
        end)
    end,
}
