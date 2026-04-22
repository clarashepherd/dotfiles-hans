return {
    {
        'mfussenegger/nvim-lint',
        lazy = false,
        config = function()
            local lint = require('lint')
            lint.linters_by_ft = {
                c = { 'cspell' },
                cpp = { 'cspell' },
            }
            vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost' }, {
                callback = function()
                    lint.try_lint()
                end,
            })
        end
    }
}
