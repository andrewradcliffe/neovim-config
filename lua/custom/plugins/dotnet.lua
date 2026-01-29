return {
    'GustavEikaas/easy-dotnet.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    ft = { "cs", "fs", "vb" },
    opts = {
        lsp = {
            enabled = false,
        }
    },
}
