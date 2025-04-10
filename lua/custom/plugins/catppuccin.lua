return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  opts = {
    transparent_background = true,
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
      dashboard = true,
      fidget = true,
      flash = true,
      gitsigns = true,
      headlines = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      leap = true,
      lsp_trouble = true,
      mason = true,
      markdown = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { 'undercurl' },
          hints = { 'undercurl' },
          warnings = { 'undercurl' },
          information = { 'undercurl' },
        },
      },
      navic = { enabled = true, custom_bg = 'none' },
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      semantic_tokens = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
    },
    custom_highlights = function(colors)
      return {
        LineNrAbove = { fg = '#6c7086', bold = true },
        LineNr = { fg = '#cdd6f4', bold = true },
        LineNrBelow = { fg = '#6c7086', bold = true },
        FloatBorder = { fg = 'white', bg = 'none' },
        AlphaHeader = { fg = colors.pink, bg = 'none' },
        NotifyBackground = { fg = colors.none or '#00000000' },
      }
    end,
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme 'catppuccin'
  end,
}
