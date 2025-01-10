local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }, -- Limit tsserver to JS/TS
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.astro.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.jdtls.setup({})

-- Configure Dart LSP
require('lspconfig').dartls.setup({
  on_attach = function(client, bufnr)
    print("Dart LSP attached to buffer " .. bufnr)
  end,
  root_dir = require('lspconfig.util').root_pattern("pubspec.yaml", ".git"),
})
require("flutter-tools").setup {} -- use defaults
require('lspconfig').flutter.setup{}
require('java').setup();
