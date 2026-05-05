vim.api.nvim_set_hl(0, 'HomepageLogo', {fg = 'White'})
vim.api.nvim_set_hl(0, 'HomepageDots', {fg = '#39FF14', bold = true})
vim.api.nvim_set_hl(0, 'HomepageMenu', {fg = '#87CEFA', bold = true})


local function show_custom_homepage()

    if vim.fn.argc() > 0 then
        return
    end


    vim.cmd('enew')

    local bufnr = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_name(bufnr, 'ㅤ')

    vim.bo.buftype = 'nofile'
    vim.bo.bufhidden = 'wipe'
    vim.bo.buflisted = false
    vim.bo.swapfile = false
    vim.bo.modifiable = false
    vim.bo.modified = false
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.cursorline = false
    vim.opt_local.signcolumn = 'yes:1'
    vim.opt_local.foldcolumn = '0'
    vim.opt_local.statusline = ' '
    vim.b.is_homepage = true

    local content = {
[[                                             ]],
[[                                             ]],
[[                                             ]],
[[                                             ]],
[[                                             ]],
[[                                             ]],
[[                                             ]],
[[                                             ]],
[[      ╔══════════════╗  •  ╔══════════════╗  ]],
[[      ║■■■■■■■■■■■■■■║•••••║■■■■■■■■■■■■■■║  ]],
[[      ║■■■■■■■■■■■■■■║•••••╠═■■■■■■■■■■■■■║  ]],
[[      ╚═╗■■■■■■■■■■╔═╝•••••╠══■■■■■■■■■■■╔╝  ]],
[[        ║■■■■■■■■■■║••••••╔╝■■■■■■■■■■■╔═╝   ]],
[[        ║■■■■■■■■■■║••••╔═╝■■■■■■■■■■╔═╝     ]],
[[        ║■■■■■■■■■■║••╔═╝■■■■■■■■■■╔═╝       ]],
[[        ║■■■■■■■■■■║╔═╝■■■■■■■■■■╔═╝••••     ]],
[[       •║■■■■■■■■■■╚╝■■■■■■■■■■╔═╝••••••••   ]],
[[     •••║■■■■■■■■■■•■■■■■■■■■╔═╝•••••••••••• ]],
[[       •║■■■■■■■■■■■■■■■■■■╔═╝••••••••••••   ]],
[[        ║■■■■■■■■■■■■■■■■╔╦╩■■••••••••••     ]],
[[        ║■■■■■■■■■■■■■■╔═╝║■■■•■■■■■■■■■■■■  ]],
[[        ║■■■■■■■■■■■■╔═╝••╚╬■■•╚╦■■•╔■■ ╔■■  ]],
[[        ║■■■■■■■■■■╔═╝•••••║■■••║■■ ║■■ ║■■  ]],
[[        ║■■■■■■■■╔═╝•••••••║■■■ ║■■■║■■■║■■■ ]],
[[        ║■■■■■■╔═╝ ••••••••╚══╝ ╚══╝╚══╝╚══╝ ]],
[[        ╚══════╝     •••••                   ]],
[[                       •                     ]],
[[                                             ]],
[[              ┏━━━━━━━━━━━━━━━━┓             ]],
[[              ┃   [e] EXPLORE ┃             ]],
[[              ┃   [f] SEARCH  ┃             ]],
[[              ┃   [r] HISTORY ┃             ]],
[[              ┃   [h] KEYMAPS ┃             ]],
[[              ┃   [s] CONFIG  ┃             ]],
[[              ┃ 󰅖  [q] QUIT    ┃             ]],
[[              ┗━━━━━━━━━━━━━━━━┛             ]],
    }


    local width = vim.fn.winwidth(0)
    local content_width = 41

    local padding_len = math.max(0, math.floor((width - content_width) / 2)) - 2
    local padding_str = string.rep(" ", padding_len)

    local centered_content = {}

    for _, line in ipairs(content) do
        table.insert(centered_content, padding_str .. line)
    end


    vim.bo[bufnr].modifiable = true
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, centered_content)
    vim.bo[bufnr].modifiable = false


    local keymaps = {buffer = bufnr, silent = true, noremap = true}

    vim.keymap.set('n', 'e', ':e .<CR>', keymaps)

    vim.keymap.set('n', 'f', ':lua require(\'telescope.builtin\').find_files({ cwd = vim.fn.expand(\'%:p:h\') })<CR>', keymaps)

    vim.keymap.set('n', 'r', ':Telescope oldfiles<CR>', keymaps)
    vim.keymap.set('n', 'q', ':q<CR>', keymaps)
    vim.keymap.set('n', 'h', ':Keymaps<CR>', keymaps)
    vim.keymap.set('n', 's', ':e ~/.config/nvim/<CR>', keymaps)

    vim.api.nvim_buf_add_highlight(bufnr, -1, 'Comment', 0, 0, 5)

    vim.cmd('syntax enable')

    vim.cmd('syntax match HomepageLogo "[■■]"')
    vim.cmd('syntax match HomepageDots "[•]"')

    vim.api.nvim_buf_add_highlight(bufnr, -1, 'HomepageMenu', 28, 0, -1)
    vim.api.nvim_buf_add_highlight(bufnr, -1, 'HomepageMenu', 29, 0, -1)
    vim.api.nvim_buf_add_highlight(bufnr, -1, 'HomepageMenu', 30, 0, -1)
    vim.api.nvim_buf_add_highlight(bufnr, -1, 'HomepageMenu', 31, 0, -1)
    vim.api.nvim_buf_add_highlight(bufnr, -1, 'HomepageMenu', 32, 0, -1)
    vim.api.nvim_buf_add_highlight(bufnr, -1, 'HomepageMenu', 33, 0, -1)
    vim.api.nvim_buf_add_highlight(bufnr, -1, 'HomepageMenu', 34, 0, -1)
    vim.api.nvim_buf_add_highlight(bufnr, -1, 'HomepageMenu', 35, 0, -1)
    vim.api.nvim_buf_add_highlight(bufnr, -1, 'HomepageMenu', 36, 0, -1)

    vim.api.nvim_win_set_cursor(0, {1, 0})

end


local homepage_group = vim.api.nvim_create_augroup('MyCustomHomepage', {clear = true})

vim.api.nvim_create_autocmd('VimEnter', {

    group = homepage_group,
    pattern = '*',
    callback = show_custom_homepage,
})







