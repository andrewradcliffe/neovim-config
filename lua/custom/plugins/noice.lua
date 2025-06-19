return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
        -- add any options here
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        'MunifTanjim/nui.nvim',
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        'rcarriga/nvim-notify',
    },
    config = function()
        require('noice').setup {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            messages = {
                enabled = true,
            },
            routes = {
                {
                    filter = {
                        event = 'msg_showmode',
                        find = 'recording @',
                    },
                    view = 'notify', -- change to "mini" if you prefer inline style
                },
                {
                    -- Show message from ':w'
                    filter = {
                        event = 'msg_show',
                        find = 'written',
                    },
                    opts = { skip = false },
                    view = 'notify',
                },
                {
                    filter = {
                        event = 'lsp',
                        kind = 'message',
                        find = 'INVALID_SERVER_MESSAGE'
                    },
                    opts = { skip = true },
                },
                {
                    filter = {
                        event = 'notify',
                        find = 'is deprecated'
                    },
                    opts = { skip = true },
                }
            },
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = false, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true, -- add a border to hover docs and signature help
            },
        }
        require('notify').setup {
            background_colour = '#000000',
            merge_duplicates = true,
            stages = 'slide',
        }

        vim.api.nvim_create_autocmd('RecordingLeave', {
            callback = function()
                vim.schedule(function()
                    require 'notify'('Stopped recording', 'info', { title = 'Notification' })
                end)
            end,
        })
    end,
}
