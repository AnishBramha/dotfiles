return {

  -- FIXED: Changed from "ionide/..." to "nvim-telescope/..."
  {
    "nvim-telescope/telescope-symbols.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      { "<leader>sym", "<cmd>Telescope symbols<cr>", desc = "Telescope Symbols" },
    },
  },
}


