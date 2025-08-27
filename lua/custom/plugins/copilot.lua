return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    enabled = false,
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = true,
          auto_trigger = false, -- only show suggestions when you explicitly ask
          keymap = {
            accept = "<M-'>", -- Accept suggestion
            next = '<M-]>', -- Cycle to next suggestion
            prev = '<M-[>', -- Cycle to previous suggestion
            dismiss = '<C-]>', -- Dismiss suggestion
          },
        },
        panel = { enabled = false },
      }
    end,
  },
  -- {
  --   'zbirenbaum/copilot-cmp',
  --   config = function()
  --     require('copilot_cmp').setup {
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     }
  --   end,
  -- },
}
