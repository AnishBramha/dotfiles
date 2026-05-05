vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if not vim.treesitter.ft_to_lang then
    vim.treesitter.ft_to_lang = function(ft)
        return vim.treesitter.language.get_lang(ft) or ft
    end
end

require('config.options')
require('config.remap')
require('config.diagnostics')
require('config.flash')
require('config.lazy')
require('config.homepage_boot')
require('config.homepage_transition')
require('config.keybindings')


