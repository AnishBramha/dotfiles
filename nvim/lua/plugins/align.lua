return {

    { "mg979/vim-visual-multi", branch = "master" },

  -- Modern alignment plugin (Replaces EasyAlign)
  {
    "echasnovski/mini.align",
    version = false,
    config = function()
      require("mini.align").setup()
    end,
  },
}



