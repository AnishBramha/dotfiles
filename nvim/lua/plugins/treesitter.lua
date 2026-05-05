return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = "master",
  main = "nvim-treesitter.configs",

  opts = {
    ensure_installed = {
      'cpp',
      'java',
      'python',
      'c',
      'lua',
      'vim',
      'vimdoc',
      'query',
      'markdown',
      'markdown_inline',
      'rust',
      'zig',
      'asm',
      'haskell',
      'bash',
    },
    autoinstall = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  },
}


