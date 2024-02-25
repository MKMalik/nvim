local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
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
