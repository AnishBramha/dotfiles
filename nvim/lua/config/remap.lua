vim.keymap.set('n', '<M-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<M-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

vim.keymap.set('v', '<', '<gv', { desc = 'Indent and preserve selection' })
vim.keymap.set('v', '>', '>gv', { desc = 'De-indent and preserve selection' })

vim.keymap.set('n', '<leader><leader>', ':noh<CR>')

-- enter nvim netrw mode
vim.keymap.set('n', '-', function()
	vim.cmd.write()
	vim.cmd.Oil()
end)


-- switch focus for integrated terminal
vim.keymap.set('t', '<C-t>', [[<C-\><C-n><C-w>w]], { desc = 'Switch tab focus' })
vim.keymap.set('n', '<M-q>', [[<C-\><C-n>:bd!<CR>]], { desc = 'Kill terminal' })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Switch to normal mode'  })
vim.keymap.set('n', '<C-t>', '<C-w>w')

vim.keymap.set('n', '<Esc>', function()

  if vim.bo.buftype == 'terminal' then
    vim.cmd('close')
  else

    vim.cmd('nohlsearch')

    local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
    vim.api.nvim_feedkeys(esc, 'n', false)
  end
end, { desc = 'Hide terminal buffer' })


local term_buf = nil
local term_win = nil

vim.keymap.set('n', '<C-j>', function()

    if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_hide(term_win)
    term_win = nil
    return
  end

  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.cmd("botright split")
    term_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(term_win, term_buf)
    return
  end


  local path

  if vim.bo.filetype == "oil" then
    path = require("oil").get_current_dir()
  else
    path = vim.fn.expand("%:p:h")
  end

  if path then
    vim.cmd("lcd " .. vim.fn.fnameescape(path))
    vim.cmd("botright split | term")
  end

  term_buf = vim.api.nvim_get_current_buf()
  term_win = vim.api.nvim_get_current_win()

end, { desc = "Open terminal in current directory" })

-- show files to select for new tab
vim.keymap.set('n', '<leader>t', ':tabe <C-d>', {silent = false, noremap = true})







