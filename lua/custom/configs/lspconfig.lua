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

