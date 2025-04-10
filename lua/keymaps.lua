-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have coliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })

-- Yank to clipboard
vim.keymap.set({ 'n', 'v' }, 'y', '"+y')
vim.keymap.set({ 'n', 'v' }, 'Y', '"+Y')

-- Paste from clipboard
vim.keymap.set({ 'n', 'v' }, 'p', '"+p')
vim.keymap.set({ 'n', 'v' }, 'P', '"+P')

-- Delete to clipboard
vim.keymap.set({ 'n', 'v' }, 'd', '"+d')
vim.keymap.set({ 'n', 'v' }, 'D', '"+D')

-- Obsidian and Markdown
vim.keymap.set('n', '<leader>oc', function()
  vim.schedule(function()
    require('obsidian').util.toggle_checkbox()
  end)
end, { desc = 'Toggle Checkbox' })

vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianToday<cr>', { desc = "[T]oday's daily note" })
vim.keymap.set('n', '<leader>oy', '<cmd>ObsidianYesterday<cr>', { desc = "[Y]esterday's daily note" })
vim.keymap.set('n', '<leader>oT', '<cmd>ObsidianTomorrow<cr>', { desc = "[T]omorrow's daily note" })
vim.keymap.set('n', '<leader>od', function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':ObsidianToday ', true, false, true), 'n', false)
end, { desc = 'Open [d]aily note' })
vim.keymap.set('n', '<leader>op', '<cmd>MarkdownPreviewToggle', { desc = 'Toggle markdown [p]review' })

-- NeoTree
vim.keymap.set('n', '<leader>e', function()
  require('neo-tree.command').execute { toggle = true, dir = vim.loop.cwd() }
end, { desc = 'Toggle Neo-tree' })

-- Alpha dashboard
vim.keymap.set('n', '<leader>;', '<cmd>Alpha<cr>', { desc = 'Open dashboard' })

-- Buffer management
vim.keymap.set('n', '<leader>bc', function()
  -- Get current buffer
  local current_buf = vim.api.nvim_get_current_buf()

  -- Get list of all listed buffers
  local buffers = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_get_option(buf, 'buflisted') and buf ~= current_buf
  end, vim.api.nvim_list_bufs())

  -- Switch to another buffer (first in list), if available
  if #buffers > 0 then
    vim.api.nvim_set_current_buf(buffers[1])
  else
    vim.cmd 'enew' -- Open empty buffer if none left
  end

  -- Then delete the old one
  vim.cmd('bdelete ' .. current_buf)
end, { desc = '[C]lose buffer', noremap = true, silent = true })

-- Terminal mappings
vim.keymap.set('n', '<C-t>', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Toggle floating terminal' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Toggle lazygit
-- function _toggle_lazygit()
--   local Terminal = require("toggleterm.terminal").Terminal
--   local lazygit = Terminal:new({
--     cmd = "lazygit",
--     hidden = true,
--     direction = "float",
--     float_opts = {
--       border = "none",
--       width = 100000,
--       height = 100000,
--       zindex = 200,
--     },
--     on_open = function(_)
--       vim.cmd "startinsert!"
--     end,
--     on_close = function(_) end,
--     count = 99,
--   })
--   lazygit:toggle()
-- end
--
-- vim.keymap.set('n', '<leader>gg', '<cmd>lua _toggle_lazygit()<cr>', { desc = 'Open lazygit', noremap = true, silent = true, })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- set conceallevel only for markdown files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt.conceallevel = 2
  end,
})

-- Disable number column in terminal buffers
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  command = 'setlocal nonumber norelativenumber',
})
