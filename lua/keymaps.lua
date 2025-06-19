-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Disable F1 key
vim.api.nvim_set_keymap('n', '<F1>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<F1>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<F1>', '<Nop>', { noremap = true, silent = true })

vim.keymap.set('n', 'ycc', 'yygccp;', { remap = true, desc = 'Duplicate line' })
vim.keymap.set('n', '<C-/>', 'gcc', { remap = true, desc = 'Comment out line' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>bd', vim.diagnostic.setloclist, { desc = 'Open [B]uffer [D]iagnostics' })

-- LSP
vim.keymap.set('n', '<leader>lr', '<cmd>LspRestart<cr>', { desc = '[R]estart LSP' })

-- Python migration script boilerplate
vim.keymap.set('n', '<leader>pm', '"mPGdd6gg$', { desc = '[P]ython [M]igration Script Boilerplate' })

-- CSV
vim.keymap.set('n', '<leader>tc', '<cmd>CsvViewToggle<cr>', { desc = '[T]oggle [C]sv Viewer' })

-- diffview commands
vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>', { desc = 'Open [G]it [D]iff' })

-- Select all in file
-- vim.keymap.set('n', '<C-a>', 'ggVG;', { remap = true, desc = 'Select all'})

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('v', '>', '>gv^')
vim.keymap.set('v', '<', '<gv^')

-- Disable default s behavior and set it for mini.surround
vim.keymap.set('n', 's', '<Nop>') -- remove default 's' in normal mode
vim.keymap.set('x', 's', '<Nop>') -- remove default 's' in visual mode

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
-- vim.keymap.set({ 'n', 'v' }, 'y', '"+y')
-- vim.keymap.set({ 'n', 'v' }, 'Y', '"+Y')
--
-- Paste from clipboard
-- vim.keymap.set({ 'n', 'v' }, 'p', '"+p')
-- vim.keymap.set({ 'n', 'v' }, 'P', '"+P')
--
-- Delete to clipboard
-- vim.keymap.set({ 'n', 'v' }, 'd', '"+d')
-- vim.keymap.set({ 'n', 'v' }, 'D', '"+D')

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
vim.keymap.set('n', '<leader>op', '<cmd>MarkdownPreviewToggle<cr>', { desc = 'Toggle markdown [p]review' })

-- NeoTree
-- vim.keymap.set('n', '<leader>e', function()
--   require('neo-tree.command').execute { toggle = true, dir = vim.loop.cwd() }
-- end, { desc = 'Toggle Neo-tree' })
vim.keymap.set('n', '<leader>e', '<cmd>Neotree reveal toggle=true<cr>', { desc = 'Toggle neo-tree' })

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

vim.keymap.set('n', '<leader>ba', function()
    vim.cmd 'bufdo bd'
    vim.cmd 'Alpha'
end, { desc = 'Close [a]ll buffers' })
vim.keymap.set('n', '<leader>bo', '<cmd>%bd|e#|bd#<cr>', { desc = 'Close all but current buffer' })

-- Terminal mappings
vim.keymap.set({ 'n', 't' }, '<C-t>', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Toggle floating terminal' })
vim.keymap.set({ 'n', 't' }, '<C-1>', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Toggle horizontal terminal' })
vim.keymap.set({ 'n', 't' }, '<C-2>', '<cmd>ToggleTerm direction=vertical<cr>', { desc = 'Toggle vertical terminal' })

-- Open VSCode at current file
vim.keymap.set('n', '<leader>wc', function()
    local file = vim.fn.expand '%:p'
    if file == '' then
        vim.notify('No file open in current buffer', vim.log.levels.WARN)
        return
    end

    local line = vim.fn.line '.'
    local col = vim.fn.col '.'
    local git_root_result = vim.fn.systemlist 'git rev-parse --show-toplevel'
    local git_root = git_root_result[1]
    local dir

    if vim.v.shell_error == 0 and git_root ~= '' then
        dir = git_root
        vim.notify('Opening VSCode at Git root: ' .. dir, vim.log.levels.INFO)
    else
        dir = vim.fn.getcwd()
        vim.notify('Git root not found, opening VSCode at cwd: ' .. dir, vim.log.levels.WARN)
    end

    local goto_arg = string.format('%s:%d:%d', file, line, col)

    vim.fn.jobstart({ 'code', dir, '--goto', goto_arg }, { detach = true })
end, { desc = 'Open VSCode at project root and file' })

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

-- Autocommand to toggle csv viewer on when entering a .csv buffer
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = { '*.csv' },
    callback = function()
        vim.opt_local.scrolloff = 2
        vim.cmd 'CsvViewEnable'
    end,
})
