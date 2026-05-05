vim.api.nvim_create_autocmd('TextYankPost', {

  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),

  callback = function()
    vim.highlight.on_yank({

        higroup = 'CurSearch'
    })
  end,
})



local flash_ns = vim.api.nvim_create_namespace('FlashChanges')
local flash_duration = 200
local flash_group = 'CurSearch'

local function read_file_lines(filepath)
  local f = io.open(filepath, 'r')
  if not f then return {} end
  local lines = {}
  for line in f:lines() do
    table.insert(lines, line)
  end
  f:close()
  return lines
end

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('FlashChangesSetup', { clear = true }),
  callback = function(opts)
    if vim.bo[opts.buf].buftype ~= '' then return end

    local filename = vim.api.nvim_buf_get_name(opts.buf)
    local old_lines = read_file_lines(filename)
    vim.b[opts.buf].old_lines_state = old_lines
  end,
})

vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('FlashChangesAction', { clear = true }),
  callback = function(opts)
    local buf = opts.buf
    local old_lines = vim.b[buf].old_lines_state

    if not old_lines then return end

    local new_lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

    local on_hunk = function(start_a, count_a, start_b, count_b)
      if count_b > 0 then
        local start_row = start_b - 1
        local end_row = start_row + count_b


        local extmark_id = vim.api.nvim_buf_set_extmark(buf, flash_ns, start_row, 0, {
          end_row = end_row,
          hl_group = flash_group,
          strict = false,
          priority = 200,
        })

        vim.defer_fn(function()
          if vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_buf_del_extmark(buf, flash_ns, extmark_id)
          end
        end, flash_duration)
      end
    end

    vim.diff(
      table.concat(old_lines, '\n'),
      table.concat(new_lines, '\n'),
      { on_hunk = on_hunk }
    )

    vim.b[buf].old_lines_state = nil
  end,
})



