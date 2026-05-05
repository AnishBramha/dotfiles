-- Define your global winbar function so Oil's win_options can access it
function _G.get_oil_winbar()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local dir = require("oil").get_current_dir(bufnr)

  if dir then
    return '  ' .. vim.fn.fnamemodify(dir, ':~')
  else
    return vim.api.nvim_buf_get_name(0)
  end
end

-- Return the Lazy plugin specification
return {
  "stevearc/oil.nvim",
  -- Dependency added to ensure your 'icon' column renders correctly
  dependencies = { "nvim-tree/nvim-web-devicons" },
  
  -- Lazy allows you to map keys to load the plugin on demand. 
  -- Uncomment the next line if you want '-' to open Oil from anywhere:
  -- keys = { { "-", "<cmd>Oil<cr>", desc = "Open parent directory" } },

  opts = {
    default_file_explorer = true,

    columns = {
      'mtime',
      'permissions',
      'size',
      'icon',
    },

    buf_options = {
      buflisted = false,
      bufhidden = 'hide',
    },

    win_options = {
      wrap = false,
      signcolumn = 'no',
      cursorcolumn = false,
      foldcolumn = '0',
      spell = false,
      list = false,
      conceallevel = 3,
      concealcursor = 'nvic',
      winbar = "%!v:lua.get_oil_winbar()",
      number = false,
      relativenumber = false,
    },

    keymaps = {
      ['g?'] = { 'actions.show_help', mode = 'n' },
      ['<CR>'] = 'actions.select',
      ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
      ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
      ['<C-z>'] = { 'actions.select', opts = { tab = true } },
      ['<C-p>'] = 'actions.preview',
      ['<C-c>'] = { 'actions.close', mode = 'n' },
      ['<C-l>'] = 'actions.refresh',
      ['-'] = { 'actions.parent', mode = 'n' },
      ['_'] = { 'actions.open_cwd', mode = 'n' },
      ['`'] = { 'actions.cd', mode = 'n' },
      ['g~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
      ['gs'] = { 'actions.change_sort', mode = 'n' },
      ['gx'] = 'actions.open_external',
      ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
      ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
      ["<C-t>"] = false,  -- interferes with tab switching custom keybind

      ['h'] = {
        callback = function()
          vim.cmd('bwipeout') 
          -- Note: Ensure `show_custom_homepage()` is defined globally elsewhere
          -- in your config, otherwise this callback will throw an error.
          if show_custom_homepage then 
            show_custom_homepage() 
          end
        end,
        desc = 'Go to homescreen',
      },

      ['q'] = {
        callback = function()
          require('oil').close()
        end,
        desc = 'Close Oil',
      },
    }, -- Closing brace for keymaps added here

    use_default_keymaps = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = false,
    prompt_save_on_select_new_entry = false,
    cleanup_delay_ms = 2000,

    lsp_file_methods = {
      enabled = true,
      timeout_ms = 1000,
      autosave_changes = false,
    },

    constrain_cursor = 'editable',
    watch_for_changes = true,

    view_options = {
      show_hidden = true,

      is_hidden_file = function(name, bufnr)
        local m = name:match('^%.')
        return m ~= nil
      end,

      is_always_hidden = function(name, bufnr)
        return false
      end,

      natural_order = 'fast',
      case_insensitive = false,

      sort = {
        {'type', 'asc'},
        {'name', 'asc'},
      },

      highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
        return nil
      end,

      extra_scp_args = {},
      extra_s3_args = {},
    }, -- Closing brace for view_options added here

    float = {
      padding = 2,
      max_width = 0,
      max_height = 0,
      border = nil,
      win_options = {
        winblend = 0,
      },
      get_win_title = nil,
      preview_split = "auto",
      override = function(conf)
        return conf
      end,
    },

    preview_win = {
      update_on_cursor_moved = true,
      preview_method = "fast_scratch",
      disable_preview = function(filename)
        return false
      end,
      win_options = {},
    },

    confirmation = {
      max_width = 0.9,
      min_width = { 40, 0.4 },
      width = nil,
      max_height = 0.9,
      min_height = { 5, 0.1 },
      height = nil,
      border = nil,
      win_options = {
        winblend = 0,
      },
    },

    progress = {
      max_width = 0.9,
      min_width = { 40, 0.4 },
      width = nil,
      max_height = { 10, 0.9 },
      min_height = { 5, 0.1 },
      height = nil,
      border = nil,
      minimized_border = "none",
      win_options = {
        winblend = 0,
      },
    },

    ssh = {
      border = nil,
    },

    keymaps_help = {
      border = nil,
    },
  }
}



