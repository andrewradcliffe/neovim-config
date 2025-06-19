return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  lazy = false,
  opts = {
        contrast = "hard",
        transparent_mode = true,
    },
  -- config = function(_, opts)
    -- local env = vim.fn.environ()
    -- local term_program = (env.TERM_PROGRAM or ''):lower()

    -- local transparent = true
    -- if term_program:find 'wezterm' then
    --   transparent = false
    -- end

    -- opts.transparent_background = transparent
    -- require('gruvbox').setup(opts)
    -- vim.o.background = 'dark'
    -- vim.cmd.colorscheme 'gruvbox'
  -- end,
}
