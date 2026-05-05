-- Define your local functions and variables at the top
local function show_buffer_status()
  return 'INACTIVE'
end

local mode_icons = {
  n      = '', -- Normal
  i      = '', -- Insert
  v      = '󰈈', -- Visual
  V      = '󰉸', -- Visual Line
  [' '] = '󰒉', -- Visual Block
  c      = '󰘳', -- Command
  no     = '', -- Operator Pending
  s      = '󰩬', -- Select
  S      = '󰿚', -- Select Line
  [' '] = '󰕢', -- Select Block
  ic     = '✎', -- Insert Completion
  R      = '󰚔', -- Replace
  Rv     = '󰚔', -- Virtual Replace
  cv     = '', -- Vim Ex
  ce     = '', -- Normal Ex
  r      = '󰚔', -- Hit-enter
  rm     = '󰚔', -- The -- more -- prompt
  ['r?'] = '󰚔', -- A :confirm query
  ['!']  = '', -- Shell or external command
  t      = '', -- Terminal
}

-- Return the Lazy plugin specification
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  
  -- Lazy allows you to use `opts` instead of a `config` function. 
  -- Whatever you pass into `opts` is automatically passed to require("lualine").setup()
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '┃', right = '┃'},
      section_separators = { left = '', right = ''},

      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },

      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = false,

      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
        refresh_time = 16,

        events = {
          'WinEnter',
          'BufEnter',
          'BufWritePost',
          'SessionLoadPost',
          'FileChangedShellPost',
          'VimResized',
          'Filetype',
          'CursorMoved',
          'CursorMovedI',
          'ModeChanged',
        },
      }
    },

    sections = {
      lualine_a = {
        {
          'mode',
          fmt = function(str)
            local mode = vim.api.nvim_get_mode().mode
            return (mode_icons[mode] or '') .. ' ' .. str
          end,
        },
      },

      lualine_b = {{'branch', icon = '󰘬'}, 'diff'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'filetype'},

      lualine_y = {
        {
          'diagnostics',
          sections = { 'error', 'warn', 'info', 'hint' },
          symbols = {error = '🚫:', warn = '⚠️:', info = 'ℹ️:', hint = '💡:'},
        }
      },

      lualine_z = {'location'},
    },

    inactive_sections = {
      lualine_a = {show_buffer_status},
      lualine_b = {},
      lualine_c = {{'filename', path = 0}},
      lualine_x = {{'datetime', style = '%d-%m-%y | %I:%M %p | %A'}},
      lualine_y = {},
      lualine_z = {'filesize', 'filetype', {'fileformat', icons_enabled = false}},
    },

    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
}
