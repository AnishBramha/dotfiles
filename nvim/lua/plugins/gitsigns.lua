return {
  "lewis6991/gitsigns.nvim",
  -- Lazy load: only load gitsigns when a file is opened
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    -- Pressing <leader>gb will blame the current line
    current_line_blame_opts = {
      delay = 500,
    },
  },
  keys = {
    { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Git Blame" },
  }
}




