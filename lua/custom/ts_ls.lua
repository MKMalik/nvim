-- Configure the JavaScript/TypeScript language server
return {
  require("lspconfig").ts_ls.setup {
    on_attach = function(client, bufnr)
      -- Keymaps for LSP
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    end,
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  }
}
