vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, { desc = 'Go to prev diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.setloclist, { desc = 'Go to next diagnostic' })


-- Diagnostic UI Configuration
vim.diagnostic.config({
    signs = true,
    virtual_text = false,
    virtual_lines = false,
    float = {
        border = 'rounded',
        source = false,
        header = false,
        prefix = '',
        wrap = true,
        max_width = 100,
        zindex = 100,
        focusable = true,
        format = function(diagnostic)
            local symbols = {
                [vim.diagnostic.severity.ERROR] = '🚫',
                [vim.diagnostic.severity.WARN] = '⚠️',
                [vim.diagnostic.severity.INFO] = 'ℹ️',
                [vim.diagnostic.severity.HINT] = '💡',
            }
            local severity = diagnostic.severity or vim.diagnostic.severity.ERROR
            local type = symbols[severity] or 'UNKNOWN'
            local message = diagnostic.message or ''
            return type .. ' ' .. message
        end
    },
    underline = true
})

-- Improve responsiveness for CursorHold events
vim.o.updatetime = 250

-- Auto-show diagnostics in a floating window on hover
local lsp_float_augroup = vim.api.nvim_create_augroup('LspFloatOnHover', { clear = true })
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    group = lsp_float_augroup,
    pattern = '*',
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false, scope = 'line' })
    end
})


