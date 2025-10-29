-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Set default shell (for toggleterm.nvim)
vim.env.TERM = 'xterm-256color'
vim.opt.shell = vim.fn.executable 'pwsh' and 'pwsh' or 'powershell'
vim.opt.shellcmdflag =
  '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.opt.shellquote = ''
vim.opt.shellxquote = ''

-- set terminal title
vim.o.title = true

-- fix noice formatting
vim.opt.cmdheight = 1

-- Remove ~ sign after EOF
vim.opt.fillchars = {
  eob = ' ',
}

-- Format options
-- This is the default value minus 'cro' which automatically adds comments
-- on the next line
vim.o.formatoptions = "jql"

-- Function to update the title with filename and current folder (project) name
local function update_title()
  local file = vim.fn.expand '%:t' -- Current filename
  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':t') -- Current directory name (project)
  if file == '' then
    file = '[No Name]'
  end
  vim.o.titlestring = string.format('%s (%s)', file, cwd)
end

-- Autocommand to update the title on events like BufEnter and DirChanged
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufFilePost', 'DirChanged' }, {
  callback = update_title,
})

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Set default tab length
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = {
    copy = {
      ['+'] = 'win32yank.exe -i --crlf',
      ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
      ['+'] = 'win32yank.exe -i --crlf',
      ['*'] = 'win32yank.exe -i --crlf',
    },
  }
end)

-- Cursor options
vim.o.cursorline = false
vim.opt.guicursor = 'n-v-c:block,i-ci:blinkon0'
vim.opt.cinoptions = '{1s'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 0

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

vim.filetype.add({
    extension = {
        razor = "razor",
    }
})
