return {
  'akinsho/toggleterm.nvim',
  -- enabled = false,
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'float', -- or "horizontal", "vertical" depending on preference
      close_on_exit = true,
      shell = nil,
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
      winbar = {
        enabled = false,
      },
    }
    -- Define the lazygit toggle function
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      hidden = true,
      direction = 'float',
      -- Use PowerShell 7
      shell = nil,
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
      dir = vim.fn.getcwd(),
      on_open = function(_)
        vim.cmd 'startinsert!'
      end,
      on_close = function(_) end,
      count = 99,
    }

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.keymap.set('n', '<leader>gg', '<cmd>lua _lazygit_toggle()<cr>', { desc = 'Open lazygit', noremap = true, silent = true })
  end,
}
