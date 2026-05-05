return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>gpf", "<cmd>Telescope find_files<cr>", desc = "Find Files Global" },
    { "<leader>pf",  function() require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') }) end, desc = "Find Files Local" },
    { "<leader>ps",  "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>mf",  "<cmd>Telescope man_pages sections={'ALL'}<cr>", desc = "Man Pages" },
    { "<C-g>",       "<cmd>Telescope git_files<cr>", desc = "Git Files" },
    { "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "List Open Buffers" },
    { "<leader>ff", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy Find in Buffer" },

  config = function()
    require("telescope").setup({

        defaults = {

            preview = {

                treesitter = false,
            },
        },
    })
    -- Load extensions inside the config function
    pcall(require('telescope').load_extension, 'symbols')
  end
}}




