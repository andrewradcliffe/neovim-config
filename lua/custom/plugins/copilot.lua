-- local copilot_term = nil
--
-- vim.keymap.set({ "n", "t" }, "<C-t>c", function()
--     if not copilot_term then
--         local Terminal = require("toggleterm.terminal").Terminal
--         copilot_term = Terminal:new({
--             cmd = "copilot",
--             hidden = true,
--             on_open = function(terminal)
--                 terminal.resize(terminal, 80)
--             end,
--             direction = "vertical",
--             close_on_exit = true,
--         })
--     end
--
--     copilot_term:toggle()
-- end, { desc = "Toggle Copilot terminal" })

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
