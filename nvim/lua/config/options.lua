local opt = vim.opt

opt.compatible = false
opt.encoding = 'utf-8'
opt.showmode = false
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = 'yes:1'
opt.termguicolors = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.showmatch = true
opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true
opt.fillchars = { eob = ' ' }
opt.guicursor = 'n-v-c-i-ci:block,r-cr:ver20hor20,o:hor50,i:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'
opt.wildmenu = true
opt.clipboard = 'unnamedplus'
opt.selectmode = 'mouse'
opt.conceallevel = 0
opt.concealcursor = ""

-- Autocommands
local autogroup = vim.api.nvim_create_augroup('user_settings', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
    group = autogroup,
    pattern = { 'markdown', 'text' },
    callback = function()
        vim.opt_local.spell = true
    end
})



