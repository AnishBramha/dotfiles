return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- Required dependency
    "sindrets/diffview.nvim",        -- Highly recommended for visual diffs
    "nvim-telescope/telescope.nvim", -- We will set this up next!
  },
  keys = {
    -- Press <space>gs to open the Neogit status buffer
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Git Status (Neogit)" },
  },
  opts = {
    -- Hides the 'are you sure?' prompt when committing
    disable_commit_confirmation = true,

    -- Tell Neogit to use its fancy integrations
    integrations = {
      telescope = true,
      diffview = true,
    },
  }
}

