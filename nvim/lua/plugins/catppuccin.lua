-- Every file in the lua/plugins folder must return a table
return {
  'catppuccin/nvim', 
  name = 'catppuccin', 
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      flavour = 'mocha', 
    })
    
    vim.cmd.colorscheme('catppuccin')
  end,
}


