return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      -- 1. Setup Mason to manage external binaries
      require('mason').setup()

      -- 2. Setup the bridge between Mason and nvim-lspconfig
      require('mason-lspconfig').setup({
        -- Automatically install these servers
        ensure_installed = { 'lua_ls', 'pyright', 'clangd' },
      })

      -- 3. Define the keymaps and behavior when an LSP connects to a buffer
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        -- Native Neovim LSP functions
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'rN', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      end

      -- 4. Set up autocomplete capabilities
      -- This allows the LSP to send data to nvim-cmp
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- 5. Enable the servers using the Neovim 0.11+ Native API
      local servers = { 'lua_ls', 'pyright', 'clangd' }

      for _, lsp in ipairs(servers) do
        -- Access the native config table for the specific server
        local config = vim.lsp.config[lsp]
        if config then
          -- Merge our custom on_attach and capabilities into the default config
          config = vim.tbl_deep_extend('force', config, {
            on_attach = on_attach,
            capabilities = capabilities,
          })

          -- Officially enable the server
          vim.lsp.enable(lsp)
        end
      end
    end,
  }
}







