return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'Work',
          path = 'C:\\Repos\\obsidian-work-notes',
        },
        {
          name = 'Japanese Notes',
          path = 'C:\\repos\\japanese-notes',
        },
      },
      templates = {
        subdir = 'templates',
      },
      daily_notes = {
        folder = 'Daily Notes',
        date_format = '%Y-%m-%d',
        template = 'Daily Note Template.md',
      },
      completion = {
        nvim_cmp = true,
      },
      mappings = {
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = true, expr = true, buffer = true },
        },
        -- ["<cr>"] = {
        --     action = function()
        --         return require("obsidian").util.smart_action()
        --     end,
        --     opts = { buffer = true, expr = true }
        -- },
      },
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
}
